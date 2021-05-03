--[[--
 @package   luarun
 @filename  luarun.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Diego Alejandro <sodomon2@gmail.com>
 @date      02.05.2021 23:00:01 -04
]]

lgi     = require('lgi')
GObject = lgi.require('GObject', '2.0')
GLib    = lgi.require('GLib', '2.0')
Gtk     = lgi.require('Gtk', '3.0')
Gdk     = lgi.require('Gdk', '3.0')
app 	= Gtk.Application()

main_window	= Gtk.Window ({
	window_position = 3,
	decorated = false,
	Gtk.Box {
		orientation = 'VERTICAL',
		spacing = 5,
		Gtk.Label {
			label = " Run Program : ",
			use_markup = true,
			margin_top = 3,
			margin_left = 3,
			halign = 1,
		},
		Gtk.Entry {
			margin_bottom = 5,
			margin_left = 5,
			margin_right = 5,
			id = 'input_exec',
			width_request	= 400
		}
	}
})

function main_window.child.input_exec:on_key_release_event(event)
	if (event.keyval  == Gdk.KEY_Return) then
		os.execute(self.text.." &")
		Gtk.main_quit()
		app:quit()
	end
end

function app:on_activate()
	main_window:show_all()
	self:add_window(main_window)
end

app:run()
