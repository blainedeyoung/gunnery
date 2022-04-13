with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Points; use Points;

package body DistanceAndBearing is

   function makeDandB(g, t: point) return dandb is
      db: dandb := (g, t, nonNeg(calcDistance(g, t)), calcQuad(g, t), calcBearing(g, t));
   begin
      return db;
   end makeDandB;

   function makeDandB(t: point) return dandb is
      g: point;
      db: dandb := (g, t, nonNeg(calcDistance(g, t)), calcQuad(g, t), calcBearing(g, t));
   begin
      return db;
   end makeDandB;

   function calcDistance(g, t: point) return Float is
      gx: Float := Float(g.x_coord);
      gy: Float := Float(g.y_coord);
      tx: Float := Float(t.x_coord);
      ty: Float := Float(t.y_coord);
      xOffset: Float := gx - tx;
      yOffset: Float := gy - ty;
      distance: Float;
   begin
      distance := Sqrt(xOffset ** 2 + yOffset ** 2);
      return distance;
   end calcDistance;

   function calcQuad(g, t: point) return nonNeg is
      i: nonNeg;
   begin
      if t.x_coord >= g.x_coord and t.y_coord <= g.y_coord then
         i := 1;
      elsif t.x_coord < g.x_coord and t.y_coord <= g.y_coord then
         i := 2;
      elsif t.x_coord <= g.x_coord and t.y_coord > g.y_coord then
         i := 3;
      elsif t.x_coord > g.x_coord and t.y_coord > g.y_coord then
         i := 4;
      end if;
      return i;
   end calcQuad;

   function calcBearing(g, t: point) return nonNeg is
      hyp: Float := calcDistance(g, t);
      quad: nonNeg range 1..4 := calcQuad(g, t);
      z: point := makePoint(t.x_coord, g.y_coord);
      opp: Float := calcDistance(t, z);
      angle: nonNeg;
      bearing: nonNeg;
      oppOverHyp: Float;
      arcsin: Float;
   begin
      oppOverHyp := opp/hyp;
      arcsin := Ada.Numerics.Elementary_Functions.Arcsin(oppOverHyp);
      angle := nonNeg(arcsin * 180.0/Ada.Numerics.Pi);
      case quad is
         when 1 =>
            bearing := 90 - angle;
         when 2 =>
            bearing := 270 + angle;
         when 3 =>
            bearing := 270 - angle;
         when 4 =>
            bearing := 90 + angle;
      end case;
      --Put_Line("");
      --printPoint(z);
      --Put_Line("The hypotenuse is:" & hyp'Image);
      --Put_Line("The opposite side is:" & opp'Image);
      --Put_Line("The opposite over the hypotenuse is:" & oppOverHyp'Image);
      --Put_Line("The arcsin is:" & arcsin'Image);
      --Put_Line("The angle is:" & angle'Image);
      --Put_Line("");
      return bearing;
   end calcBearing;

   procedure printDandB(d: dandb) is
   begin
      Put_Line("");
      Put_Line("Your points are: ");
      Put_Line("Gun:" & d.gun.x_coord'Image & d.gun.y_coord'Image);
      Put_Line("Target:" & d.target.x_coord'Image & d.target.y_coord'Image);
      Put_Line("The distance between gun and target is:" & d.distance'Image);
      --Put_Line("With respect to the gun the target is in quadrant:" & d.quad'Image);
      Put_Line("With respect to the gun the target's bearing is:" & d.bearing'Image);
      Put_Line("");
   end printDandB;

end DistanceAndBearing;

