class Clock < Gtk::Box
    def initialize
        super(:vertical, 0)

        add_css_class('item')

        append(icon)
        append(Gtk::Label.new(hour))
        append(Gtk::Label.new(minute))

        GLib::Timeout.add(1000000) do
            update_time
            
            true
        end
    end

    private

    def update_time
        children[1].set_text(hour)
        children[2].set_text(minute)
    end

    def icon
       label = Gtk::Label.new('')

       label.add_css_class('item__icon')

       label
    end

    def hour
        Time.now.strftime('%H')
    end

    def minute
        Time.now.strftime('%M')
    end
end