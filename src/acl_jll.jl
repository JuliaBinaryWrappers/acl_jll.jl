# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule acl_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("acl")
JLLWrappers.@generate_main_file("acl", UUID("ed5aba05-e74d-5cf7-8b09-107ba3463b8e"))
end  # module acl_jll
