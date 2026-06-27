require("lint").linters_by_ft = {
  java = { "checkstyle" }
}

require("lint").linters.checkstyle.args = {
  "-X",
  "ImportOrder,CustomImportOrder"
}
