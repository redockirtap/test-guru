//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .
//= require_self


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "utilities/sorting"
import "utilities/checkPasswords"
import "utilities/formInline"
import "utilities/progressBar"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

