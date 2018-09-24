
DEPS = {

    "com_google_protobuf": {
        "rule": "http_archive",
        # TODO(mgh): The upstream rules currently use v3.5.1. We need `protobuf-3.6.1` because
        # otherwise the `py_proto_library` does not include GRPC generated files in its outputs.
        # If https://github.com/pubref/rules_protobuf ever updates to v3.6.1 then we can stop using
        # a fork.
        "url": "https://github.com/google/protobuf/archive/v3.6.1.zip",
        "strip_prefix": "protobuf-3.6.1",
        "sha256": "d7a221b3d4fb4f05b7473795ccea9e05dab3b8721f6286a95fffbffc2d926f8b",
    },


    # This binds the cc_binary "protoc" into
    # //external:protoc. Required by grpc++.
    "protoc": {
        "rule": "bind",
        "actual": "@com_google_protobuf//:protoc",
    },

    # Bind the protobuf proto_lib into //external.  Required for
    # compiling the protoc_gen_grpc plugin
    "protocol_compiler": {
        "rule": "bind",
        "actual": "@com_google_protobuf//:protoc",
    },

    # grpc++ expects "//external:protobuf"
    "protobuf": {
        "rule": "bind",
        "actual": "@com_google_protobuf//:protobuf",
    },

    # grpc++ expects "//external:protobuf_clib"
    "protobuf_clib": {
        "rule": "bind",
        "actual": "@com_google_protobuf//:protoc_lib",
    },

    "protobuf_headers": {
        "rule": "bind",
        "actual": "@com_google_protobuf//:protobuf_headers",
    },

}
