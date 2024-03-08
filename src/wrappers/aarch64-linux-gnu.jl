# Autogenerated wrapper script for acl_jll for aarch64-linux-gnu
export chacl, getfacl, libacl, setfacl

using Attr_jll
JLLWrappers.@generate_wrapper_header("acl")
JLLWrappers.@declare_library_product(libacl, "libacl.so.1")
JLLWrappers.@declare_executable_product(chacl)
JLLWrappers.@declare_executable_product(getfacl)
JLLWrappers.@declare_executable_product(setfacl)
function __init__()
    JLLWrappers.@generate_init_header(Attr_jll)
    JLLWrappers.@init_library_product(
        libacl,
        "lib/libacl.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        chacl,
        "bin/chacl",
    )

    JLLWrappers.@init_executable_product(
        getfacl,
        "bin/getfacl",
    )

    JLLWrappers.@init_executable_product(
        setfacl,
        "bin/setfacl",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
