JenkinsStatusReader = {}
JenkinsStatusReader.__index = JenkinsStatusReader

function JenkinsStatusReader:create(http, url, authHeader)
  local reader = {}             -- our new object
  setmetatable(reader,JenkinsStatusReader)  -- make Account handle lookup
  reader.http = http
  reader.url = url
  reader.authHeader = authHeader

  return reader
end

function JenkinsStatusReader:read(callback, error)
  self.http:get(reader.url, reader.authHeader, callback)
end

return JenkinsStatusReader
