with Ada.Text_IO;  use Ada.Text_IO;
with Points; use Points;

package body Units is

   function makeUnit(p: point; mv: nonNeg) return unit is
      u: unit;
   begin
      u.position := p;
      u.muzzle_velocity := mv;
      return u;
   end makeUnit;

   procedure printUnit(u: unit) is
   begin
      Put_Line("");
      Put_Line("The unit's position is this point:");
      printPoint(u.position);
      Put_Line("The unit's muzzle velocity is:" & u.muzzle_velocity'Image);
      Put_Line("");
   end printUnit;

end Units;
