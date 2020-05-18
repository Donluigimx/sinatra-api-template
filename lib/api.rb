
class API
  class << self
    attr_reader :app
  end

  def self.load!(app, path)
    @app = app
    path = File.join(path, '/*.rb')
    for file in Dir[path] do
      require(file)
    end
  end

  def self.get(routes, &block)
    API.app.get(routes) do
      instance_eval(&block)
    end
  end
end