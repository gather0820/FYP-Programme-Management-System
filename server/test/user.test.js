let should = require('should');
describe('Array', function () {
    describe('#indexOf()', function () {
        it('should return -1 when the value is not present', function () {
            let arr = [1, 2, 3]
            arr.indexOf(1).should.eql(0);
        });
    });
});
