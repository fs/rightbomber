expect = require('chai').expect
Rect = require('../../app/abstract/rect')

describe 'Rect', ->
  rect = new Rect
  describe 'intersections', ->
    neighbor = new Rect
    neighbor.moveBy(0.5, 0.5)

    child = new Rect
    child.moveBy(0.25, 0.25)
    child.setSize(0.5)

    boundaryNeighbor = new Rect
    boundaryNeighbor.moveBy(1, 0)

    describe '#intersectsWith()', ->
      it 'is ok for intersecting rects', ->
        expect(rect.intersectsWith(neighbor)).to.be.ok

      it 'is ok for touching rects', ->
        expect(rect.intersectsWith(boundaryNeighbor)).to.be.ok

    describe '#intersectionArea()', ->
      it 'computes intersection area correctly', ->
        expect(rect.intersectionArea(neighbor)).to.equal(0.25)

      it 'equals 0 for touching rects', ->
        expect(rect.intersectionArea(boundaryNeighbor)).to.equal(0)

    describe '#contains()', ->
      it 'is ok for rect containing another', ->
        expect(rect.contains(child)).to.be.ok

      it 'is not ok for touching rects', ->
        expect(rect.contains(boundaryNeighbor)).not.to.be.ok
