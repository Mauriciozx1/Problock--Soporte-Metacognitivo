<xml id="startBlocks" style="display: none">
    <block type="variables_set" inline="true" x="20" y="20">
        <field name="VAR">n</field>
        <value name="VALUE">
            <block type="math_number">
                <field name="NUM">1</field>
            </block>
        </value>
        <next>
            <block type="controls_repeat_ext" inline="true">
                <value name="TIMES">
                    <block type="math_number">
                        <field name="NUM">4</field>
                    </block>
                </value>
                <statement name="DO">
                    <block type="variables_set" inline="true">
                        <field name="VAR">n</field>
                        <value name="VALUE">
                            <block type="math_arithmetic" inline="true">
                                <field name="OP">MULTIPLY</field>
                                <value name="A">
                                    <block type="variables_get">
                                        <field name="VAR">n</field>
                                    </block>
                                </value>
                                <value name="B">
                                    <block type="math_number">
                                        <field name="NUM">2</field>
                                    </block>
                                </value>
                            </block>
                        </value>
                    </block>
                </statement>
                <next>
                    <block type="text_console" inline="false">
                        <value name="CONSOLE">
                            <block type="variables_get">
                                <field name="VAR">n</field>
                            </block>
                        </value>
                    </block>
                </next>
            </block>
        </next>
    </block>
</xml>