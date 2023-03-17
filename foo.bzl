load("echo.bzl", "echo")

def append(append_list, append_value):
    append_list.append(append_value)
    echo(
        name = append_value,
        contents = append_value + "_contents",
    )

def append_declare_outs(append_list, append_value):
    append_list.append(append_value)
    native.genrule(
        name = "make_" + append_value,
        outs = [append_value],
        cmd = "echo " + append_value + "_contents > $@",
    )
