with Points; use Points;
with DistanceAndBearing; use DistanceAndBearing;
with Units; use Units;

package firingSolution is

   subtype nonNeg is Integer range 0..Integer'Last;
   type fSolution is
      record
         firer: unit;
         path: dandb;
         inclination: nonNeg;
         flightTime: nonNeg;
         expectedOffTarget: nonNeg;
      end record;
   
   function makeFSolution(g: unit; d: dandb) return fSolution;
   procedure calc(f: fSolution);
   procedure correct(h, l: nonNeg);
   function projectDistance(inc: nonNeg) return nonNeg; 
   --function radiansToDegrees(d: nonNeg) return Float;
   procedure printFSolution(f: fSolution);

end firingSolution;
