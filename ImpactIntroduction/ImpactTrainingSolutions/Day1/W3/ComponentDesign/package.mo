within ImpactTrainingSolutions.Day1.W3;
package ComponentDesign
    package Components
        model ElasticShaft
            .Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = J1) annotation(Placement(transformation(extent = {{-50,-10},{-30,10}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c=c,d=d) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = J2) annotation(Placement(transformation(extent = {{30,-10},{50,10}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(extent = {{-110,-10},{-90,10}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(extent = {{90,-10},{110,10}},origin = {0,0},rotation = 0)));
            parameter .Modelica.Units.SI.Inertia J1 = 0.1 "Inertia 1";
            parameter .Modelica.Units.SI.Inertia J2 = 0.3;
            parameter .Modelica.Units.SI.RotationalSpringConstant c = 1000;
            parameter .Modelica.Units.SI.RotationalDampingConstant d = 1;
        equation
            connect(inertia1.flange_b,springDamper.flange_a) annotation(Line(points = {{-30,0},{-10,0}},color = {0,0,0}));
            connect(springDamper.flange_b,inertia2.flange_a) annotation(Line(points = {{10,0},{30,0}},color = {0,0,0}));
            connect(inertia2.flange_b,flange_b) annotation(Line(points = {{50,0},{100,0}},color = {0,0,0}));
            connect(inertia1.flange_a,flange_a) annotation(Line(points = {{-50,0},{-100,0}},color = {0,0,0}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Rectangle(origin={0,-3},extent={{-86.79775280898876,15.00684600868917},{86,-15}},fillPattern=FillPattern.Solid,fillColor={155,155,155})}),Documentation(info = "<html><p>This is an elastic shaft.</p></html>"));
        end ElasticShaft;
    end Components;
    package Experiments
        model TestShaft
            .Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{-50,-8},{-30,12}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(Placement(transformation(extent = {{16,-12},{36,8}},origin = {0,0},rotation = 0)));
            .Modelica.Blocks.Sources.Sine sine(amplitude = 100,f = 2) annotation(Placement(transformation(extent = {{-82,-8},{-62,12}},origin = {0,0},rotation = 0)));
            .ImpactTrainingSolutions.Day1.W3.ComponentDesign.Components.ElasticShaft elasticShaft(J1 = 0.7,J2 = 0.4,c = 100000) annotation(Placement(transformation(extent = {{-14.0,-8.0},{6.0,12.0}},origin = {0.0,0.0},rotation = 0.0)));
        equation
            connect(sine.y,torque.tau) annotation(Line(points = {{-61,2},{-52,2}},color = {0,0,127}));
            connect(torque.flange,elasticShaft.flange_a) annotation(Line(points = {{-30,2},{-14,2}},color = {0,0,0}));
            connect(elasticShaft.flange_b,fixed.flange) annotation(Line(points = {{6,2},{26,2},{26,-2}},color = {0,0,0}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
        end TestShaft;
    end Experiments;
end ComponentDesign;
