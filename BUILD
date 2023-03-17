load("foo.bzl", "append", "append_declare_outs")

test_list = glob(["*.txt"])

append_declare_outs(test_list, "declared")

append(test_list, "lazy")

genrule(
    name = "print_list",
    srcs = test_list,
    outs = ["list_1.txt"],
    cmd = "echo \"" + repr(test_list) + "\" > $@; cat $(location base.txt) >> $@; cat $(location lazy) >> $@; cat $(location declared) >> $@",
)

sh_binary(
    name = "cat_list",
    srcs = ["cat_list.sh"],
    args = ["$(location %s)" % value for value in test_list],
    data = test_list,
)

py_binary(
    name = "cat_list_py",
    srcs = ["cat_list.py"],
    args = ["$(location %s)" % value for value in test_list],
    data = test_list,
    main = "cat_list.py",
)
