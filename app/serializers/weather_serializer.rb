class WeatherSerializer
  include JSONAPI::Serializer
  attributes :city, :local_time, :temp_f, :temp_c
end
