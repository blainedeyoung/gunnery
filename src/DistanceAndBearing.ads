with Points; use Points;

package DistanceAndBearing is

   subtype nonNeg is Integer range 0..Integer'Last;
   type dandb is
      record
         gun: point;
         target: point;
         distance: nonNeg;
         quad: nonNeg;
         bearing: Integer range 0..359;
      end record;

   function makeDandB(g, t: point) return dandb;
   function makeDandB(t: point) return dandb;
   function calcDistance(g, t: point) return Float;
   function calcQuad(g, t: point) return nonNeg;
   function calcBearing(g, t: point) return nonNeg;
   procedure printDandB(d: dandb);

end DistanceAndBearing;
