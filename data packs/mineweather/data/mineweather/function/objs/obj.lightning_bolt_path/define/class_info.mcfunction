#
# mineweather:objs/obj.lightning_bolt_path/define/class_info
#

data modify storage io: class_info set value {\
	name: "mineweather:lightning_bolt_path",\
	extends: "obj:obj",\
	abstract: false,\
	runtime_method_list: [\
		"delete",\
		"new",\
		"start_generation",\
		"update"\
	]\
}

return 1
