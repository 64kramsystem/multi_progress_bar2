require 'curses'
require 'progressbar'
require 'delegate'

require 'multi_progress_bar/version'

module MultiProgressBar
  class << self
    attr_reader :bars

    # Set up the screen.  Always call +MultiProgressBar.start+ before using progress bars.
    def start
      @bars = [].freeze

      Curses.init_screen
      Curses.curs_set(0)
      Curses.start_color

      (0..7).each { |color_number| Curses.init_pair(color_number, color_number, Curses::COLOR_BLACK); }

      @bars_window = Curses::Window.new(1, 0, Curses.lines-1, 0)
      @log_window  = Curses::Window.new(Curses.lines-1, 0, 0, 0)
      @log_window.scrollok(true)

      trap("SIGWINCH") do
        Curses.close_screen
        Curses.refresh

        refresh_window_positions

        @bars.each do |bar|
          bar.width = @bars_window.maxx
          bar.show
        end
      end
    end

    # Restore the terminal to normal function.  Always call this before exiting.
    def end
      # Give an extra line below the output for the shell to prompt on.
      add_bar(nil)

      Curses.close_screen
    end

    # Write +text+ to the space above the progress bars.
    def log(text)
      text = text.to_s

      # Parse ANSI escape codes.
      text.scan(/([^\e]*)(?:\e\[(\d+.))?/) do |normal_text, code|
        @log_window.addstr(normal_text)
        case code
          when /3(\d)m/
            @log_window.attron(Curses.color_pair($1.to_i))
          when /0m/
            @log_window.attron(Curses.color_pair(7))
        end
      end
      @log_window.addstr("\n")
      @log_window.refresh
    end

    def width  #:nodoc:
      @bars_window.maxx
    end

    def refresh_window_positions
      @bars_window.move(Curses.lines-bars.size, @bars_window.begx)
      @bars_window.resize(bars.size, @bars_window.maxx)
      @bars_window.refresh

      @log_window.resize(Curses.lines-bars.size, @log_window.maxx)
      @log_window.refresh
    end

    def add_bar(bar)  #:nodoc:
      @bars += [bar]
      refresh_window_positions
    end

    def update_bar(bar, rendered_bar)  #:nodoc:
      @bars_window.setpos(bars.index(bar), 0)
      @bars_window.attron(Curses.color_pair(bar.color)) if bar.color
      @bars_window.addstr(rendered_bar)
      @bars_window.attroff(Curses.color_pair(bar.color)) if bar.color
      @bars_window.refresh
    end
  end
end

require 'multi_progress_bar/bar_renderer'
require 'multi_progress_bar/bar'
require 'multi_progress_bar/total_bar'
