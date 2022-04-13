with Points; use Points;

package Units is

   subtype nonNeg is Integer range 0..Integer'Last;
   type unit is
      record
         position: point;
         muzzle_velocity: nonNeg := 4000;
      end record;

   function makeUnit(p: point; mv: nonNeg) return unit;
   procedure printUnit(u: unit);

   end Units;
