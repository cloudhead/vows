var vows = require('../lib/vows'),
    assert = require('assert');

var getFirstWord = function (str, callback) {
    callback(str.split(' ')[0]);
};
vows.describe('Using this.callbackWithoutError inside a topic').addBatch({
    'Calling getFirstWord with "hello world!"': {
        topic: function () {
            return getFirstWord('hello world!', this.callbackWithoutError);
        },
        'should result in "hello"': function (result) {
            assert.equal('hello', result);
        }
    }
}).export(module);
