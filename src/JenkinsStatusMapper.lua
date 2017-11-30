cjson = require "cjson"
JenkinsStatusMapper = {}
JenkinsStatusMapper.__index = JenkinsStatusMapper

function JenkinsStatusMapper:map(data)
  jsonData = cjson.decode(data)
  result = {}
  if string.find(jsonData["color"], "blue") then
    result["status"] = "green"
  elseif string.find(jsonData["color"], "red") then
    result["status"] = "red"
  end

  result["building"] = false
  if string.find(jsonData["color"], "anime") then
    result["building"] = true
  end

  result["buildNumber"] = tostring(jsonData["lastBuild"]["number"])
  return result
end

return JenkinsStatusMapper
