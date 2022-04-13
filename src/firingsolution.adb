with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Points; use Points;
with DistanceAndBearing; use DistanceAndBearing;
with Units; use Units;

package body firingSolution is

   f: fSolution;
   
   function makeFSolution(g: unit, d: dandb) return fSolution is
      f.firer := g;
      f.path := d;
      calc(f);
      return f;
   end makeFSolution;
   
   procedure calc(f: fSolution) is
      dis: nonNeg := f.path.distance;
      lowInc: nonNeg;
      highInc: nonNeg;
      maxDis: nonNeg; 
      pDis: nonNeg; 
      minDis: nonNeg; 
      accepted: Boolean := false;
   begin
      pDis := projectDis(45);
      if pDis = dis then
         f.inclination = 45;
         accepted := true;
      elsif pDis > dis then
         maxDis := projectDis(89);
         if maxDis = dis then
            f.inclination = 89;
            accepted := true;
         end if;
      elsif pDis < dis then
         minDis := projectDis(1);
         if minDis = dis then
            f.inclination = 1;
            accepted := true;
         end if;
      elsif pDis < dis and not accepted then 
         correct(89, 45);
      elsif pDis > dis and not accepted then
         correct(45, 1);
      end if;
   end calc;
      
   procedure correct(h, l: nonNeg) is
      dis: nonNeg := f.path.distance;
      m: nonNeg := nonNeg((h+l)/2);
      pDis: nonNeg := projectDistance(m);
      accepted : Boolean := false;
   begin 
      if pDis = dis then
         f.inclination = m;
      elsif h - m <= 1 or m - l <= 1 then
         f.inclination = m;
         accepted := true;
      elsif pDis > dis and not accepted then
         correct(m, l);
      elsif pDis < dis and not accepted then
         correct(h, m);
      end if;
   end correct;
         
   function projectDis(inc: nonNeg) return nonNeg is
      muzVelocity: nonNeg := f.firer.muzzle_velocity;
      flightTime: nonNeg;
      estOffTarget: nonNeg;   
      yVelocity: Sin(Float(inc)) * Float(mv);
      xVelocity: Cos(Float(inc)) * Float(mv);
   begin
      
   end projectDistance;
   
--   function radiansToDegrees(d: nonNeg) return Float is
      
--   end radiansToDegrees;
   
   procedure printFSolution(f: fSolution) is
   
   end printFSolution;
   
end firingSolution;
