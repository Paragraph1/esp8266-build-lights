describe("JenkinsStatusReader Tests", function()
    local match = require("luassert.match")

    it("Initializing the reader sets all variables", function()
      local http = {}
      JenkinsStatusReader = require("../src/JenkinsStatusReader")
      reader = JenkinsStatusReader:create(http, "http://url?it=is", "some header")

      assert.are.equal(http, reader.http)
      assert.are.same("http://url?it=is", reader.url)
      assert.are.same("some header", reader.authHeader)
    end)

    it("reading calls http get", function()
      http = { get = function(caller, url, header, callback) callback(200, "data") end }
      callBackFunction = function ()  end
      http_spy = spy.on(http, "get")


      JenkinsStatusReader = require("../src/JenkinsStatusReader")
      reader = JenkinsStatusReader:create(http, "http://url?it=is", "some header")
      reader:read(callBackFunction);



      assert.spy(http_spy).was_called_with(match.is_table(), "http://url?it=is", "some header", callBackFunction)
    end)

end)
