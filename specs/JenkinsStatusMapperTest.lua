describe("JenkinsStatusMapper Tets", function()
    jenkinsRedExample = [[
      {
        "_class": "org.jenkinsci.plugins.workflow.job.WorkflowJob",
        "color": "red",
        "lastBuild": {
          "_class": "org.jenkinsci.plugins.workflow.job.WorkflowRun",
          "number": 89
        }
      }]]

    jenkinsGreenExample = [[
      {
        "_class": "org.jenkinsci.plugins.workflow.job.WorkflowJob",
        "color": "blue",
        "lastBuild": {
          "_class": "org.jenkinsci.plugins.workflow.job.WorkflowRun",
          "number": 89
        }
      }]]

    jenkinsRedBuildingExample = [[
      {
        "_class": "org.jenkinsci.plugins.workflow.job.WorkflowJob",
        "color": "red_anime",
        "lastBuild": {
          "_class": "org.jenkinsci.plugins.workflow.job.WorkflowRun",
          "number": 89
        }
      }]]

    jenkinsGreenBuildingExample = [[
      {
        "_class": "org.jenkinsci.plugins.workflow.job.WorkflowJob",
        "color": "blue_anime",
        "lastBuild": {
          "_class": "org.jenkinsci.plugins.workflow.job.WorkflowRun",
          "number": 89
        }
      }]]

    it("Mapping should return green status", function()
      JenkinsStatusMapper = require("../src/JenkinsStatusMapper")
      result = JenkinsStatusMapper:map(jenkinsGreenExample)
      assert.are.same("green", result["status"])
    end)

    it("Mapping should return red status", function()
      JenkinsStatusMapper = require("../src/JenkinsStatusMapper")
      result = JenkinsStatusMapper:map(jenkinsRedExample)
      assert.are.same("red", result["status"])
    end)

    it("Mapping should return build number", function()
      JenkinsStatusMapper = require("../src/JenkinsStatusMapper")
      result = JenkinsStatusMapper:map(jenkinsRedExample)
      assert.are.same("89", result["buildNumber"])
    end)

    it("Mapping should building status building", function()
      JenkinsStatusMapper = require("../src/JenkinsStatusMapper")
      result = JenkinsStatusMapper:map(jenkinsRedBuildingExample)
      assert.is_true(result["building"])
    end)

    it("Mapping should building status not buding", function()
      JenkinsStatusMapper = require("../src/JenkinsStatusMapper")
      result = JenkinsStatusMapper:map(jenkinsRedExample)
      assert.is_false(result["building"])
    end)

    it("Mapping should building status is red", function()
      JenkinsStatusMapper = require("../src/JenkinsStatusMapper")
      result = JenkinsStatusMapper:map(jenkinsRedBuildingExample)
      assert.are.same("red", result["status"])
    end)

    it("Mapping should building status is green", function()
      JenkinsStatusMapper = require("../src/JenkinsStatusMapper")
      result = JenkinsStatusMapper:map(jenkinsGreenBuildingExample)
      assert.are.same("green", result["status"])
    end)
end)
