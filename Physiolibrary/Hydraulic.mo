within Physiolibrary;
package Hydraulic "Pressure and Volumetric Flow"
 extends Modelica.Icons.Package;
  package Examples
    "Examples that demonstrate usage of the Pressure flow components"
  extends Modelica.Icons.ExamplesPackage;

    model CardiovascularSystem_GCG
      "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
       extends Modelica.Icons.Example;

       import Physiolibrary.Hydraulic;

      Components.ElasticVessel
                     pulmonaryVeins(
        volume_start(displayUnit="l") = 0.0004,
        ZeroPressureVolume(displayUnit="l") = 0.0004,
        Compliance(displayUnit="l/mmHg") = 7.5006157584566e-08)
        annotation (Placement(transformation(extent={{34,64},{54,84}})));
      Components.ElasticVessel
                     pulmonaryArteries(
        ZeroPressureVolume(displayUnit="l") = 0.00030625,
        Compliance(displayUnit="l/mmHg") = 3.6002955640592e-08,
        volume_start(displayUnit="l") = 0.00038,
        useV0Input=false,
        useComplianceInput=false,
        useExternalPressureInput=false)
        annotation (Placement(transformation(extent={{-32,64},{-12,84}})));
      Hydraulic.Components.Conductor
               pulmonary(Conductance(displayUnit="l/(mmHg.min)") = 4.1665920538226e-08)
        annotation (Placement(transformation(extent={{0,64},{20,84}})));
      Components.ElasticVessel
                     arteries(
        volume_start(displayUnit="l") = 0.00085,
        ZeroPressureVolume(displayUnit="l") = 0.000495,
        Compliance(displayUnit="l/mmHg") = 2.6627185942521e-08)
        annotation (Placement(transformation(extent={{44,-56},{64,-36}})));
      Components.ElasticVessel
                     veins(
        Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
        volume_start(displayUnit="l") = 0.00325,
        ZeroPressureVolume(displayUnit="l") = 0.00295)
        annotation (Placement(transformation(extent={{-34,-56},{-14,-36}})));
      Hydraulic.Components.Conductor
               nonMuscle(Conductance(displayUnit="l/(mmHg.min)") = 3.5627924852669e-09)
        annotation (Placement(transformation(extent={{6,-56},{26,-36}})));
      Sensors.PressureMeasure
                      pressureMeasure
        annotation (Placement(transformation(extent={{-48,16},{-28,36}})));
      Components.Pump
           rightHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{-26,-2},{-6,18}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst RNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{-30,30},{-22,38}})));
      Sensors.PressureMeasure
                      pressureMeasure1
        annotation (Placement(transformation(extent={{22,16},{42,36}})));
      Components.Pump
           leftHeart(useSolutionFlowInput=true)
        annotation (Placement(transformation(extent={{46,-4},{66,16}})));
      Physiolibrary.Types.Constants.VolumeFlowRateConst LNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
        annotation (Placement(transformation(extent={{42,32},{50,40}})));
      Hydraulic.Components.Conductor
               kidney(Conductance(displayUnit="l/(mmHg.min)") = 1.4126159678427e-09)
        annotation (Placement(transformation(extent={{6,-74},{26,-54}})));
      Hydraulic.Components.Conductor
               muscle(Conductance(displayUnit="l/(mmHg.min)") = 1.3001067314658e-09)
        annotation (Placement(transformation(extent={{6,-38},{26,-18}})));
      Hydraulic.Components.Conductor
               largeVeins(Conductance(displayUnit="l/(mmHg.min)") = 1.6888886482791e-07)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-54,-18})));
      Components.ElasticVessel
                     rightAtrium(
        volume_start(displayUnit="l") = 0.0001,
        ZeroPressureVolume(displayUnit="l") = 0.0001,
        Compliance(displayUnit="l/mmHg") = 3.7503078792283e-08)
        annotation (Placement(transformation(extent={{-52,-2},{-32,18}})));
      Physiolibrary.Blocks.Factors.Input2Effect rightStarling(data={{-6,0,0},{-3,0.15,0.104},{-1,0.52,
            0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}})
        "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{-26,12},{-6,32}})));
      Physiolibrary.Blocks.Factors.Input2Effect leftStarling(data={{-4,0,0},{-1,
            0.72,0.29},{0,1.01,0.29},{3,1.88,0.218333},{10,2.7,0}})
        "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
        annotation (Placement(transformation(extent={{46,12},{66,32}})));
    equation
      connect(pulmonaryArteries.q_in,pulmonary. q_in) annotation (Line(
          points={{-22,74},{0,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonary.q_out,pulmonaryVeins. q_in) annotation (Line(
          points={{20,74},{44,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, nonMuscle.q_in)  annotation (Line(
          points={{-24,-46},{6,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(nonMuscle.q_out, arteries.q_in)  annotation (Line(
          points={{26,-46},{54,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.q_out,pulmonaryArteries. q_in) annotation (Line(
          points={{-6,8},{2,8},{2,50},{-40,50},{-40,74},{-22,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.q_in,pulmonaryVeins. q_in) annotation (Line(
          points={{46,6},{26,6},{26,50},{62,50},{62,74},{44,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftHeart.q_out,arteries. q_in) annotation (Line(
          points={{66,6},{74,6},{74,-46},{54,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure.q_in,rightHeart. q_in) annotation (Line(
          points={{-42,20},{-42,8},{-26,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure1.q_in,pulmonaryVeins. q_in) annotation (Line(
          points={{28,20},{26,20},{26,50},{62,50},{62,74},{44,74}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_out, arteries.q_in) annotation (Line(
          points={{26,-28},{40,-28},{40,-46},{54,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_out, arteries.q_in) annotation (Line(
          points={{26,-64},{40,-64},{40,-46},{54,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(kidney.q_in, nonMuscle.q_in) annotation (Line(
          points={{6,-64},{-4,-64},{-4,-46},{6,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(muscle.q_in, nonMuscle.q_in) annotation (Line(
          points={{6,-28},{-4,-28},{-4,-46},{6,-46}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(veins.q_in, largeVeins.q_out) annotation (Line(
          points={{-24,-46},{-54,-46},{-54,-28}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(largeVeins.q_in, rightAtrium.q_in) annotation (Line(
          points={{-54,-8},{-54,8},{-42,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightAtrium.q_in, rightHeart.q_in) annotation (Line(
          points={{-42,8},{-26,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RNormalCO.y, rightStarling.yBase) annotation (Line(
          points={{-21,34},{-16,34},{-16,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.actualPressure, rightStarling.u) annotation (Line(
          points={{-32,22},{-24,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(LNormalCO.y, leftStarling.yBase) annotation (Line(
          points={{51,36},{56,36},{56,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure1.actualPressure, leftStarling.u) annotation (Line(
          points={{38,22},{48,22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure.q_in, rightAtrium.q_in) annotation (Line(
          points={{-42,20},{-42,20},{-42,8}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightHeart.solutionFlow, rightStarling.y) annotation (Line(
          points={{-16,12},{-16,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(leftStarling.y, leftHeart.solutionFlow) annotation (Line(
          points={{56,18},{56,10}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Documentation(info="<html>
<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
<p><br/>Model, all parameters and all initial values are from article: </p>
<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &QUOT;Circulation: overall regulation.&QUOT; Annual review of physiology 34(1): 13-44.</p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end CardiovascularSystem_GCG;

  end Examples;

  package Components
    extends Modelica.Icons.Package;

    model Conductor
     extends Physiolibrary.Hydraulic.Interfaces.OnePort;
     extends Physiolibrary.Icons.HydraulicResistor;

      parameter Boolean useConductanceInput = false
        "=true, if external conductance value is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.HydraulicConductance Conductance=0
        "Hydraulic conductance if useConductanceInput=false"
        annotation (Dialog(enable=not useConductanceInput));

      Physiolibrary.Types.RealIO.HydraulicConductanceInput cond(start=Conductance)=c if useConductanceInput
                                                       annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));

    protected
       Physiolibrary.Types.HydraulicConductance c;
    equation
      if not useConductanceInput then
        c=Conductance;
      end if;

      q_in.q = c * (q_in.pressure - q_out.pressure);
      annotation (Icon(graphics), Diagram(coordinateSystem(preserveAspectRatio=
                false, extent={{-100,-100},{100,100}}), graphics));
    end Conductor;

    model Pump
      extends Physiolibrary.Hydraulic.Interfaces.OnePort;
      extends Chemical.Interfaces.ConditionalSolutionFlow;

    equation
      q_in.q = q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-40},{100,60}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,35},{80,10},{-80,-15},{-80,35}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-90},{150,-50}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",     info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
    end Pump;

    model Reabsorption "Divide inflow to outflow and reabsorption"
      import Physiolibrary;
      extends Physiolibrary.Icons.Reabsorption;

      Physiolibrary.Hydraulic.Interfaces.PositivePressureFlow
                           Inflow                    annotation (Placement(
            transformation(extent={{-114,26},{-86,54}})));
      Physiolibrary.Hydraulic.Interfaces.NegativePressureFlow
                           Outflow
        annotation (Placement(transformation(extent={{86,26},{114,54}})));
      Physiolibrary.Hydraulic.Interfaces.NegativePressureFlow
                           Reabsorption                annotation (Placement(
            transformation(extent={{-14,-114},{14,-86}})));

      Physiolibrary.Types.RealIO.FractionInput FractReab
                                   annotation (Placement(transformation(extent={{-100,
                -60},{-60,-20}})));

      parameter Boolean useExternalOutflowMin = false
        "=true, if minimal outflow is garanted"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.VolumeFlowRate OutflowMin = 0
        "Minimal outflow if useExternalOutflowMin=false"
        annotation (Dialog(enable=not useExternalOutflowMin));

      Physiolibrary.Types.RealIO.VolumeFlowRateInput outflowMin(start=OutflowMin) = om if useExternalOutflowMin
                                                           annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={40,80})));

    protected
       Physiolibrary.Types.VolumeFlowRate om;
    equation
      if not useExternalOutflowMin then
        om = OutflowMin;
      end if;

      Inflow.pressure = Outflow.pressure;
      0 = Inflow.q + Outflow.q + Reabsorption.q;

      Reabsorption.q = -min(0,FractReab*(Inflow.q-OutflowMin));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),       graphics={Text(
              extent={{-100,130},{100,108}},
              lineColor={0,0,255},
              textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<p><h4><font color=\"#008000\">Hydraulic Reabsorption</font></h4></p>
<p>If useOutflowMin=false then the next schema is used.</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Documentation/HydraulicReabsorption.png\"/></li>
</ul></p>
<p><br/>If  useOutflowMin=true then the extended schema is used:</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Documentation/HydraulicReabsorptionWithOutflowMin.png\"/></li>
</ul></p>
</html>"));
    end Reabsorption;

    model HydrostaticColumn
      "Create hydrostatic pressure between connectors in different altitude with specific pressure pump effect"
      extends Physiolibrary.Icons.HydrostaticGradient;
      Physiolibrary.Hydraulic.Interfaces.PositivePressureFlow
                           q_up "Top site"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{66,26},{94,54}})));

      Interfaces.PositivePressureFlow
                           q_down "Bottom site"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{66,-74},{94,-46}})));

      parameter Boolean useHeightInput = false "=true, if height input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Physiolibrary.Types.Height H=0
        "Height of hydrostatic column if useHeightInput=false"
        annotation (Dialog(enable=not useFlowInput));

      Physiolibrary.Types.RealIO.HeightInput height(start=H)=h if useHeightInput
        "Vertical distance between top and bottom connector"
                                                   annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=0,
            origin={-60,0})));

      parameter Modelica.SIunits.Density ro=1060; //liquid density

      parameter Boolean useExternalG = false
        "=true, if external gravity acceleration is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      parameter Types.Acceleration GravityAcceleration = 9.81
        "Gravity acceleration if useExternalG=false"
        annotation (Dialog(enable=not useExternalG));

       //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.

      Physiolibrary.Types.RealIO.AccelerationInput G(start=GravityAcceleration)=g if useExternalG
        "Gravity acceleration"                                                                           annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=90,
            origin={0,-100})));

      parameter Boolean usePumpEffect = false
        "=true, if musce pump effect is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

      Physiolibrary.Types.RealIO.FractionInput
                            pumpEffect(start=PumpEffect)=pe if       usePumpEffect      annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,100})));

    protected
      parameter Types.Fraction PumpEffect = 1
        "Pump effect if usePumpEffect=false"
        annotation (Dialog(enable=not usePumpEffect));

    protected
      Types.Acceleration g;
      Types.Fraction pe;
      Types.Height h;
    equation
      if not useHeightInput then
        h=H;
      end if;
      if not useExternalG then
        g=GravityAcceleration;
      end if;
      if not usePumpEffect then
        pe = PumpEffect;
     end if;

      q_down.pressure = q_up.pressure + g*ro*h*pe;
      q_up.q + q_down.q = 0;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics),Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end HydrostaticColumn;

    model ElasticVessel "Elastic container"
     extends Icons.ElasticBalloon;
     extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                        state_start=volume_start, storeUnit=
          "ml");

      Interfaces.PositivePressureFlow
                           q_in
                            annotation (Placement(
            transformation(extent={{-14,-14},{14,14}})));
      parameter Physiolibrary.Types.Volume volume_start = 0
        "Volume start value"
         annotation (Dialog(group="Initialization"));

      Physiolibrary.Types.Volume excessVolume
        "Additional volume, that generate pressure";

       parameter Boolean useV0Input = false
        "=true, if zero-pressure-volume input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Physiolibrary.Types.Volume ZeroPressureVolume = 0
        "Maximal volume, that does not generate pressure if useV0Input=false"
        annotation (Dialog(enable=not useV0Input));
       Physiolibrary.Types.RealIO.VolumeInput zeroPressureVolume(start=ZeroPressureVolume) if useV0Input
                                                        annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-80,80})));

      parameter Boolean useComplianceInput = false
        "=true, if compliance input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.HydraulicCompliance Compliance = 1
        "Compliance if useComplianceInput=false"
        annotation (Dialog(enable=not useComplianceInput));

      Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance(start=Compliance) if useComplianceInput
                                                            annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,80})));

      parameter Boolean useExternalPressureInput = false
        "=true, if external pressure input is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
      parameter Physiolibrary.Types.Pressure ExternalPressure=0
        "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false."
        annotation (Dialog(enable=not useExternalPressureInput));

      Physiolibrary.Types.RealIO.PressureInput externalPressure(start=ExternalPressure) if useExternalPressureInput
                                                       annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={80,80})));

      Physiolibrary.Types.RealIO.VolumeOutput volume
                                            annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));

    protected
      Physiolibrary.Types.Volume zpv;
      Physiolibrary.Types.HydraulicCompliance c;
      Physiolibrary.Types.Pressure ep;

    equation
      if not useV0Input then
        zpv=ZeroPressureVolume;
      end if;
      if not useComplianceInput then
        c=Compliance;
      end if;
      if not useExternalPressureInput then
        ep=ExternalPressure;
      end if;

      excessVolume = max( 0, volume - zpv);
      q_in.pressure = excessVolume/c + ep;

      state = volume; // der(volume) =  q_in.q;
      change = q_in.q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}),     graphics={Text(
              extent={{-150,-150},{150,-110}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end ElasticVessel;

    model ElasticMembrane "Elastic balloon in closed space"
     extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                        state_start=volume_start, storeUnit=
          "ml");
     extends Icons.InternalElasticBalloon;
      Interfaces.PositivePressureFlow
                           q_int "Internal space"
        annotation (Placement(transformation(extent={{-94,-14},{-66,14}})));
      Interfaces.NegativePressureFlow
                           q_ext "External space" annotation (Placement(transformation(extent={{26,-14},
                {54,14}})));

     parameter Physiolibrary.Types.HydraulicCompliance Compliance "Compliance";
     parameter Physiolibrary.Types.Volume zeroPressureVolume=0
        "Maximal volume, that does not generate pressure";
     parameter Physiolibrary.Types.Volume volume_start=0 "Volume start value"
         annotation (Dialog(group="Initialization"));
     Physiolibrary.Types.Volume volume;
     Physiolibrary.Types.Volume stressedVolume;

     parameter Physiolibrary.Types.Volume NominalVolume=1e-6
        "Scale numerical calculation from quadratic meter to miniliters.";

    equation
      q_int.q + q_ext.q = 0;
      q_int.pressure = (stressedVolume/Compliance) + q_ext.pressure;
      stressedVolume = max(volume-zeroPressureVolume,0);

      state = volume; // der(volume) =  q_int.q;
      change = q_int.q;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end ElasticMembrane;

    model Inertia "Inertia of the volumetric flow"
      extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                         state_start=volumeFlow_start,
        storeUnit="ml/min");
      extends Interfaces.OnePort;
      extends Icons.Inertance;

      parameter Physiolibrary.Types.VolumeFlowRate volumeFlow_start=0.3
        "Volumetric flow start value"
         annotation (Dialog(group="Initialization"));                                                          //5 l/min is normal volumetric flow in aorta

      parameter Physiolibrary.Types.HydraulicInertance I "Inertance";

    equation
      state = q_in.q;      // I*der(q_in.q) = (q_in.pressure - q_out.pressure);
      change = (q_in.pressure - q_out.pressure)/I;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),                Documentation(info="<html>
<p>Inertance I of the simple tube could be calculated as I=ro*l/A, where ro is fuid density, l is tube length and A is tube cross-section area.</p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end Inertia;
  end Components;

  package Sensors
    extends Modelica.Icons.SensorsPackage;
    model FlowMeasure
      "Convert connector volume flow value to signal flow value"
      extends Interfaces.OnePort;
      extends Icons.FlowMeasure;

      Physiolibrary.Types.RealIO.VolumeFlowRateOutput actualFlow
        "Actual volume flow rate"
                             annotation (Placement(transformation(extent={{-20,-20},
                {20,20}},
            rotation=270,
            origin={0,-60})));
    equation
      q_out.pressure = q_in.pressure;

      actualFlow = q_in.q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics),Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FlowMeasure;

    model PressureMeasure
      "Convert connector hydraulic pressure value to signal flow value"
      extends Icons.PressureMeasure;

      Interfaces.PositivePressureFlow
                           q_in annotation (Placement(
            transformation(extent={{-60,-80},{-20,-40}})));
      Physiolibrary.Types.RealIO.PressureOutput actualPressure
        "Actual pressure"    annotation (Placement(transformation(extent={{40,-60},
                {80,-20}})));
    equation

      actualPressure = q_in.pressure;
      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                100}}),     graphics),Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PressureMeasure;
  end Sensors;

  package Sources
    extends Modelica.Icons.SourcesPackage;
    model UnlimitedPump
      extends Chemical.Interfaces.ConditionalSolutionFlow;

      Interfaces.NegativePressureFlow
                           q_out
                             annotation (Placement(
            transformation(extent={{86,-14},{114,14}})));
    equation
      q_out.q = - q;

     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-94},{150,-54}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",     info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
    end UnlimitedPump;

      model UnlimitedVolume
      "Boundary compartment with defined pressure and any volume in/outflow"
        import Physiolibrary.Types.*;

        parameter Boolean usePressureInput = false
        "=true, if pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Pressure P=0 "Hydraulic pressure if usePressureInput=false"
          annotation (Dialog(enable=not usePressureInput));

        RealIO.PressureInput pressure(start=P)=p if usePressureInput "Pressure"
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}},
              rotation=0)));

        Interfaces.PositivePressureFlow
                             y "PressureFlow output connectors"
          annotation (Placement(transformation(extent={{84,-16},{116,16}},
              rotation=0)));

       parameter Physiolibrary.Types.SimulationType  Simulation=SimulationType.NormalInit
        "If in equilibrium, then zero-flow equation is added."
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

    protected
        Pressure p;
      equation
        if not usePressureInput then
          p=P;
        end if;

        y.pressure = p;

        if Simulation==SimulationType.SteadyState or (initial() and Simulation==SimulationType.InitSteadyState) then
          y.q = 0;
        end if;

        annotation (Documentation(info="<html>
<p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
<p>Usage in tests: Set defaul volume&GT;0 and try to set STEADY in instances to &QUOT;false&QUOT;!</p>
</html>",revisions=
           "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),
                          graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillColor={170,255,255},
              fillPattern=FillPattern.Backward),
              Text(
                extent={{0,0},{-100,-100}},
                lineColor={0,0,0},
              textString="P"),
              Line(
                points={{-100,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255})}),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}), graphics));
      end UnlimitedVolume;
  end Sources;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;
    connector PressureFlow "Hydraulical Pressure-VolumeFlow connector"
      Physiolibrary.Types.Pressure pressure "Pressure";
      flow Physiolibrary.Types.VolumeFlowRate q "Volume flow";
      annotation (Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009-2013</td>
</tr>
</table>
</html>",
        info="<html>
<p><font style=\"font-size: 9pt; \">This connector connects hydraulic domains elements. The elements contains one equation for each his pressure-flow connector. The equation defines relation between variables in the connector. Variables are hydraulic pressure and volume flow of hydraulic medium. The pressure is the same in each connector that are connected together. The sum of flow in connectors connected together is zero (</font><b><font style=\"font-size: 9pt; \">Kirchhoff&apos;s circuit laws</font></b><font style=\"font-size: 9pt; \">).</font> </p>
</html>"));
    end PressureFlow;

    connector PositivePressureFlow "Hydraulical inflow connector"
      extends Interfaces.PressureFlow;

    annotation (
        defaultComponentName="q_in",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={0,0,0},
              lineThickness=1), Polygon(
              points={{-1.22465e-014,100},{100,1.22465e-014},{1.22465e-014,-100},
                  {-100,-1.22465e-014},{-1.22465e-014,100}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0},
              origin={0,0},
              rotation=180)}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
              points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0}),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,0}, textString = "%name")}),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

    end PositivePressureFlow;

    connector NegativePressureFlow "Hydraulical inflow connector"
      extends Interfaces.PressureFlow;

    annotation (
        defaultComponentName="q_out",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={0,0,0},
              lineThickness=1), Polygon(
              points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={200,200,200})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Polygon(
              points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={200,200,200}),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,0}, textString = "%name")}));
    end NegativePressureFlow;

    partial model OnePort "Hydraulical OnePort"

      Interfaces.PositivePressureFlow
                           q_in "Volume inflow" annotation (Placement(
            transformation(extent={{-114,-14},{-86,14}})));
      Interfaces.NegativePressureFlow
                           q_out "Volume outflow"
                             annotation (Placement(
            transformation(extent={{86,-14},{114,14}})));

    equation
      q_in.q + q_out.q = 0;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
    end OnePort;
  end Interfaces;
  annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the ideal block of blood accumulation called ElasticBalloon.</p>
</html>"));
end Hydraulic;
