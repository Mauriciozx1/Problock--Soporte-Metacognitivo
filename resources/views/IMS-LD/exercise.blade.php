<imscp:manifest xmlns:imscp="http://www.imsglobal.org/xsd/imscp_v1p1"
                xmlns:imsld="http://www.imsglobal.org/xsd/imsld_v1p0"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.imsglobal.org/xsd/imscp_v1p1 http://www.imsglobal.org/xsd/imscp_v1p1p3.xsd http://www.imsglobal.org/xsd/imsld_v1p0 http://www.imsglobal.org/xsd/imsld_level_b_v1p0.xsd"
                identifier="Calculator-Manifest">
    <imscp:metadata>
        <imscp:schema>IMS Metadata</imscp:schema>
        <imscp:schemaversion>1.2</imscp:schemaversion>
    </imscp:metadata>
    <imscp:organizations>
        <imsld:learning-design identifier="LD-calories-calculator" uri="URI" level="B">
            <imsld:title>Calculadora de Calorias</imsld:title>

            <imsld:learning-objectives>
                <imsld:item identifier="LOB-Calorie-Calculator-Objectives"
                            identifierref="RES-Calorie-Calculator-Objectives"/>
            </imsld:learning-objectives>

            <imsld:prerequisites>
                <imsld:item identifier="PREQ-Learning-Platform-Familiarity" identifierref="RES-Learning-Platform-Familiarity"/>
            </imsld:prerequisites>

            <imsld:components>

                <imsld:roles>
                    <imsld:learner identifier="R-student"/>
                </imsld:roles>

                <imsld:properties>

                    <imsld:locpers-property identifier="P-Activation-Task-Completed-Flag">
                        <imsld:datatype datatype="boolean"/>
                        <imsld:initial-value>false</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Elaboration-Task-Completed-Flag">
                        <imsld:datatype datatype="boolean"/>
                        <imsld:initial-value>false</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Consolidation-Task-Completed-Flag">
                        <imsld:datatype datatype="boolean"/>
                        <imsld:initial-value>false</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Reflection-Task-Completed-Flag">
                        <imsld:datatype datatype="boolean"/>
                        <imsld:initial-value>false</imsld:initial-value>
                    </imsld:locpers-property>

                    <imsld:locpers-property identifier="P-Logic-Activity-Result">
                        <imsld:datatype datatype="integer"/>
                        <imsld:initial-value>""</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Conditionals-Activity-Result">
                        <imsld:datatype datatype="integer"/>
                        <imsld:initial-value>""</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Basal-Metabolic-Rate-Activity-Result">
                        <imsld:datatype datatype="integer"/>
                        <imsld:initial-value>""</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Daily-Consumed-Calories-Activity-Result">
                        <imsld:datatype datatype="integer"/>
                        <imsld:initial-value>""</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Food-Calories-Array-Activity-Result">
                        <imsld:datatype datatype="string"/>
                        <imsld:initial-value>""</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Allowed-Calories-Activity-Result">
                        <imsld:datatype datatype="integer"/>
                        <imsld:initial-value>""</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Calculator-Modules-Integration-Activity-Result">
                        <imsld:datatype datatype="integer"/>
                        <imsld:initial-value>""</imsld:initial-value>
                    </imsld:locpers-property>
                    <imsld:locpers-property identifier="P-Budget-Calculator-Comparison-Test-Result">
                        <imsld:datatype datatype="integer"/>
                        <imsld:initial-value>""</imsld:initial-value>
                    </imsld:locpers-property>

                </imsld:properties>

                <imsld:activities>

                    <imsld:learning-activity identifier="LA-logic-training">
                        <imsld:title>Usando la Lógica</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-objectives>
                            <imsld:item identifierref="RES-logic-training-objectives"/>
                        </imsld:learning-objectives>
                        <imsld:activity-description>
                            <imsld:item identifier="I-logic-training" identifierref="RES-logic-training"/>
                        </imsld:activity-description>
                    </imsld:learning-activity>

                    <imsld:learning-activity identifier="LA-conditionals-training">
                        <imsld:title>Tomemos una Decisión</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-objectives>
                            <imsld:item identifierref="RES-conditionals-training-objectives"/>
                        </imsld:learning-objectives>
                        <imsld:activity-description>
                            <imsld:item identifier="I-conditionals-training" identifierref="RES-conditionals-training"/>
                        </imsld:activity-description>
                        <imsld:on-completion>
                            <imsld:change-property-value>
                                <imsld:property-ref ref="P-Activation-Task-Completed-Flag"/>
                                <imsld:property-value>true</imsld:property-value>
                            </imsld:change-property-value>
                        </imsld:on-completion>
                    </imsld:learning-activity>

                    <imsld:learning-activity identifier="LA-basal-metabolic-rate-calculator">
                        <imsld:title>Ritmo Metabólico Basal</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-objectives>
                            <imsld:item identifierref="RES-basal-metabolic-rate-calculator-objectives"/>
                        </imsld:learning-objectives>
                        <imsld:activity-description>
                            <imsld:item identifier="I-basal-metabolic-rate-calculator" identifierref="RES-basal-metabolic-rate-calculator"/>
                        </imsld:activity-description>
                    </imsld:learning-activity>

                    <imsld:learning-activity identifier="LA-daily-consumed-calories-calculator">
                        <imsld:title>Calorías Diarias</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-objectives>
                            <imsld:item identifierref="RES-daily-consumed-calories-calculator-objectives"/>
                        </imsld:learning-objectives>
                        <imsld:activity-description>
                            <imsld:item identifier="I-daily-consumed-calories-calculator" identifierref="RES-daily-consumed-calories-calculator"/>
                        </imsld:activity-description>
                    </imsld:learning-activity>

                    <imsld:learning-activity identifier="LA-food-calories-array-design">
                        <imsld:title>Calorías en la Comida</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-objectives>
                            <imsld:item identifierref="RES-food-calories-array-design-objectives"/>
                        </imsld:learning-objectives>
                        <imsld:activity-description>
                            <imsld:item identifier="I-food-calories-array-design" identifierref="RES-food-calories-array-design"/>
                        </imsld:activity-description>
                    </imsld:learning-activity>

                    <imsld:learning-activity identifier="LA-allowed-calories-calculator">
                        <imsld:title>¿Cuanta Comida?</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-objectives>
                            <imsld:item identifierref="RES-allowed-calories-calculator-objectives"/>
                        </imsld:learning-objectives>
                        <imsld:activity-description>
                            <imsld:item identifier="I-allowed-calories-calculator" identifierref="RES-allowed-calories-calculator"/>
                        </imsld:activity-description>

                        <imsld:on-completion>
                            <imsld:change-property-value>
                                <imsld:property-ref ref="P-Elaboration-Task-Completed-Flag"/>
                                <imsld:property-value>true</imsld:property-value>
                            </imsld:change-property-value>
                        </imsld:on-completion>
                    </imsld:learning-activity>

                    <imsld:learning-activity identifier="LA-calories-calculator-modules-integration">
                        <imsld:title>Integrando los Módulos</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-objectives>
                            <imsld:item identifierref="RES-calories-calculator-modules-integration-objectives"/>
                        </imsld:learning-objectives>
                        <imsld:activity-description>
                            <imsld:item identifier="I-calories-calculator-modules-integration" identifierref="RES-calories-calculator-modules-integration"/>
                        </imsld:activity-description>
                        <imsld:on-completion>
                            <imsld:change-property-value>
                                <imsld:property-ref ref="P-Consolidation-Task-Completed-Flag"/>
                                <imsld:property-value>true</imsld:property-value>
                            </imsld:change-property-value>
                        </imsld:on-completion>
                    </imsld:learning-activity>

                    <imsld:learning-activity identifier="LA-budget-calculator-comparison-test">
                        <imsld:title>Calculador de Presupuesto</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-objectives>
                            <imsld:item identifierref="RES-budget-calculator-comparison-test-objectives"/>
                        </imsld:learning-objectives>
                        <imsld:activity-description>
                            <imsld:item identifier="I-budget-calculator-comparison-test" identifierref="RES-budget-calculator-comparison-test"/>
                        </imsld:activity-description>
                        <imsld:on-completion>
                            <imsld:change-property-value>
                                <imsld:property-ref ref="P-Reflection-Task-Completed-Flag"/>
                                <imsld:property-value>true</imsld:property-value>
                            </imsld:change-property-value>
                        </imsld:on-completion>
                    </imsld:learning-activity>

                    <imsld:activity-structure identifier="AS-activation-task" number-to-select="2" structure-type="sequence">
                        <imsld:title>Conceptos Claves</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-activity-ref ref="LA-logic-training"/>
                        <imsld:learning-activity-ref ref="LA-conditionals-training"/>
                    </imsld:activity-structure>

                    <imsld:activity-structure identifier="AS-elaboration-task" number-to-select="4" structure-type="sequence">
                        <imsld:title>Solucionando el Problema</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-activity-ref ref="LA-basal-metabolic-rate-calculator"/>
                        <imsld:learning-activity-ref ref="LA-daily-consumed-calories-calculator"/>
                        <imsld:learning-activity-ref ref="LA-food-calories-array-design"/>
                        <imsld:learning-activity-ref ref="LA-allowed-calories-calculator"/>
                    </imsld:activity-structure>

                    <imsld:activity-structure identifier="AS-consolidation-task" number-to-select="1" structure-type="sequence">
                        <imsld:title>Integración de Solución</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-activity-ref ref="LA-calories-calculator-modules-integration"/>
                    </imsld:activity-structure>

                    <imsld:activity-structure identifier="AS-reflection-task" number-to-select="1" structure-type="sequence">
                        <imsld:title>Reflexionando lo Aprendido</imsld:title>
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:learning-activity-ref ref="LA-budget-calculator-comparison-test"/>
                    </imsld:activity-structure>

                    <imsld:activity-structure identifier="AS-PBL-storyline" number-to-select="4" structure-type="sequence">
                        <imsld:environment-ref ref="E-interactive-learning-platform"/>
                        <imsld:activity-structure-ref ref="AS-activation-task"/>
                        <imsld:activity-structure-ref ref="AS-elaboration-task"/>
                        <imsld:activity-structure-ref ref="AS-consolidation-task"/>
                        <imsld:activity-structure-ref ref="AS-reflection-task"/>
                    </imsld:activity-structure>

                </imsld:activities>

                <imsld:environments>
                    <imsld:environment identifier="E-interactive-learning-platform">
                        <imsld:title>Plataforma Interactiva de Aprendizaje</imsld:title>
                    </imsld:environment>
                </imsld:environments>

            </imsld:components>

            <imsld:method>

                <imsld:play identifier="PLAY-PBL-Storyline" isvisible="true">

                    <imsld:act identifier="ACT-interactive-learning">
                        <imsld:role-part identifier="RP-interactive-learning">
                            <imsld:role-ref ref="R-student"/>
                            <imsld:activity-structure-ref ref="AS-PBL-storyline"/>
                        </imsld:role-part>
                        <imsld:complete-act>
                            <imsld:when-role-part-completed ref="RP-interactive-learning"/>
                        </imsld:complete-act>
                    </imsld:act>

                    <imsld:complete-play>
                        <imsld:when-last-act-completed/>
                    </imsld:complete-play>

                </imsld:play>
                <!--Si se han completado las actividades de Consolidation Task-->
                <imsld:conditions>
                    <imsld:if>
                        <imsld:is>
                            <imsld:property-ref ref="P-Consolidation-Task-Completed-Flag"/>
                            <imsld:property-value>true</imsld:property-value>
                        </imsld:is>
                    </imsld:if>
                    <imsld:then>
                        <imsld:show>
                            <imsld:learning-activity-ref ref="LA-budget-calculator-comparison-test"/>
                        </imsld:show>
                    </imsld:then>
                    <imsld:else>
                        <!--Si se han completado las actividades de Elaboration Task-->
                        <imsld:if>
                            <imsld:is>
                                <imsld:property-ref ref="P-Elaboration-Task-Completed-Flag"/>
                                <imsld:property-value>true</imsld:property-value>
                            </imsld:is>
                        </imsld:if>
                        <imsld:then>
                            <imsld:show>
                                <imsld:learning-activity-ref ref="LA-calories-calculator-modules-integration"/>
                            </imsld:show>
                        </imsld:then>
                        <imsld:else>
                            <!--Si se han completado las actividades de Activation Task-->
                            <imsld:if>
                                <imsld:is>
                                    <imsld:property-ref ref="P-Activation-Task-Completed-Flag"/>
                                    <imsld:property-value>true</imsld:property-value>
                                </imsld:is>
                            </imsld:if>
                            <imsld:then>
                                <imsld:show>
                                    <imsld:learning-activity-ref ref="LA-basal-metabolic-rate-calculator"/>
                                </imsld:show>
                            </imsld:then>
                            <imsld:else>
                                <imsld:show>
                                    <imsld:learning-activity-ref ref="LA-logic-training"/>
                                </imsld:show>
                            </imsld:else>
                        </imsld:else>
                    </imsld:else>
                </imsld:conditions>
            </imsld:method>
        </imsld:learning-design>
    </imscp:organizations>
    <imscp:resources>
        <!--Se asume que el estudiante esta familiarizado con el uso de la plataforma-->
        <imscp:resource identifier="RES-Learning-Platform-Familiarity" type="webcontent"/>
        <!--Se detallan los objetivos de la actividad, los cuales son el aprendizaje de logica y condicionales-->
        <imscp:resource identifier="RES-Calorie-Calculator-Objectives" type="webcontent"/>
        <!--Todos los recursos asociados a cada una de las actividades a realizar-->
        <!--Contiene instrucciones, referencias y resultados esperados-->
        <imscp:resource identifier="RES-logic-training" type="webcontent"/>
        <imscp:resource identifier="RES-conditionals-training" type="webcontent"/>
        <imscp:resource identifier="RES-basal-metabolic-rate-calculator" type="webcontent"/>
        <imscp:resource identifier="RES-daily-consumed-calories-calculator" type="webcontent"/>
        <imscp:resource identifier="RES-food-calories-array-design" type="webcontent"/>
        <imscp:resource identifier="RES-allowed-calories-calculator" type="webcontent"/>
        <imscp:resource identifier="RES-calories-calculator-modules-integration" type="webcontent"/>
        <imscp:resource identifier="RES-budget-calculator-comparison-test" type="webcontent"/>

    </imscp:resources>
</imscp:manifest>