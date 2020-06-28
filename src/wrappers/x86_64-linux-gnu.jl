# Autogenerated wrapper script for acl_jll for x86_64-linux-gnu
export chacl, getfacl, libacl, setfacl

using Attr_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `chacl`
const chacl_splitpath = ["bin", "chacl"]

# This will be filled out by __init__() for all products, as it must be done at runtime
chacl_path = ""

# chacl-specific global declaration
function chacl(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(chacl_path)
    end
end


# Relative path to `getfacl`
const getfacl_splitpath = ["bin", "getfacl"]

# This will be filled out by __init__() for all products, as it must be done at runtime
getfacl_path = ""

# getfacl-specific global declaration
function getfacl(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(getfacl_path)
    end
end


# Relative path to `libacl`
const libacl_splitpath = ["lib", "libacl.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libacl_path = ""

# libacl-specific global declaration
# This will be filled out by __init__()
libacl_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libacl = "libacl.so.1"


# Relative path to `setfacl`
const setfacl_splitpath = ["bin", "setfacl"]

# This will be filled out by __init__() for all products, as it must be done at runtime
setfacl_path = ""

# setfacl-specific global declaration
function setfacl(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(setfacl_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"acl")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Attr_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Attr_jll.LIBPATH_list,))

    global chacl_path = normpath(joinpath(artifact_dir, chacl_splitpath...))

    push!(PATH_list, dirname(chacl_path))
    global getfacl_path = normpath(joinpath(artifact_dir, getfacl_splitpath...))

    push!(PATH_list, dirname(getfacl_path))
    global libacl_path = normpath(joinpath(artifact_dir, libacl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libacl_handle = dlopen(libacl_path)
    push!(LIBPATH_list, dirname(libacl_path))

    global setfacl_path = normpath(joinpath(artifact_dir, setfacl_splitpath...))

    push!(PATH_list, dirname(setfacl_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

