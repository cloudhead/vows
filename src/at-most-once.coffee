# at-most-once.coffee -- run a function at most once
#
# Copyright 2016 fuzzy.io <evan@fuzzy.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

debug = require('debug')('perjury:at-most-once')

atMostOnce = (fn) ->
  called = false
  (args...) ->
    if !called
      called = true
      fn.apply null, args
    else
      throw new Error "Function called more than once!"

module.exports = atMostOnce