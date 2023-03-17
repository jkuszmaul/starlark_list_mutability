def _echo_impl(ctx):
    out = ctx.actions.declare_file(ctx.attr.name)

    ctx.actions.run_shell(
        progress_message = "Generating " + out.short_path,
        outputs = [out],
        command = "echo \"" + ctx.attr.contents + "\" > " + out.path,
    )

    return [DefaultInfo(files = depset([out])), OutputGroupInfo(out = depset([out]))]

echo = rule(
    attrs = {
        "contents": attr.string(
            mandatory = True,
        ),
    },
    implementation = _echo_impl,
)
