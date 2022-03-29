brew install swift-protobuf

protoc  --swift_opt=Visibility=Public --swift_out=. usermgmt/usermgmt.proto