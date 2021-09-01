{:ok, channel} = GRPC.Stub.connect("localhost:50051", interceptors: [GRPC.Logger.Client])

{:error, error} =
  channel |> Helloworld.Greeter.Stub.say_hello(Helloworld.HelloRequest.new(name: "quota_failure:test"))

IO.inspect(error, label: "error")
