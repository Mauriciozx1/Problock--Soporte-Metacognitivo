<xml id="toolbox" style="display: none">
    <category id="catLogic" colour="210" name="Logica">
        <block type="logic_compare"></block>
        <block type="controls_if"></block>
        <block type="logic_operation"></block>
        <block type="logic_negate"></block>
        <block type="logic_boolean"></block>
        <block type="logic_null"></block>
        <block type="logic_ternary"></block>
    </category>
    <category id="catLoops" colour="120" name="Ciclos">
        <block type="controls_repeat_ext">
            <value name="TIMES">
                <shadow type="math_number">
                    <field name="NUM">10</field>
                </shadow>
            </value>
        </block>
        <block type="controls_whileUntil"></block>
        <block type="controls_for">
            <value name="FROM">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="TO">
                <shadow type="math_number">
                    <field name="NUM">10</field>
                </shadow>
            </value>
            <value name="BY">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
        </block>
        <block type="controls_forEach"></block>
        <block type="controls_flow_statements"></block>
    </category>
    <category id="catMath" colour="230" name="Matemática">
        <block type="math_number"></block>
        <block type="math_arithmetic">
            <value name="A">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="B">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
        </block>
        <block type="math_single">
            <value name="NUM">
                <shadow type="math_number">
                    <field name="NUM">9</field>
                </shadow>
            </value>
        </block>
        <block type="math_trig">
            <value name="NUM">
                <shadow type="math_number">
                    <field name="NUM">45</field>
                </shadow>
            </value>
        </block>
        <block type="math_constant"></block>
        <block type="math_number_property">
            <value name="NUMBER_TO_CHECK">
                <shadow type="math_number">
                    <field name="NUM">0</field>
                </shadow>
            </value>
        </block>
        <block type="math_change">
            <value name="DELTA">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
        </block>
        <block type="math_round">
            <value name="NUM">
                <shadow type="math_number">
                    <field name="NUM">3.1</field>
                </shadow>
            </value>
        </block>
        <block type="math_on_list"></block>
        <block type="math_modulo">
            <value name="DIVIDEND">
                <shadow type="math_number">
                    <field name="NUM">64</field>
                </shadow>
            </value>
            <value name="DIVISOR">
                <shadow type="math_number">
                    <field name="NUM">10</field>
                </shadow>
            </value>
        </block>
        <block type="math_constrain">
            <value name="VALUE">
                <shadow type="math_number">
                    <field name="NUM">50</field>
                </shadow>
            </value>
            <value name="LOW">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="HIGH">
                <shadow type="math_number">
                    <field name="NUM">100</field>
                </shadow>
            </value>
        </block>
        <block type="math_random_int">
            <value name="FROM">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="TO">
                <shadow type="math_number">
                    <field name="NUM">100</field>
                </shadow>
            </value>
        </block>
        <block type="math_random_float"></block>
    </category>
    <category id="catText" colour="160" name="Texto">
        <block type="text"></block>
        <block type="text_console"></block>
        <block type="text_join"></block>
        <block type="text_append">
            <value name="TEXT">
                <shadow type="text"></shadow>
            </value>
        </block>
        <block type="text_length">
            <value name="VALUE">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        <block type="text_isEmpty">
            <value name="VALUE">
                <shadow type="text">
                    <field name="TEXT"></field>
                </shadow>
            </value>
        </block>
        <block type="text_indexOf">
            <value name="VALUE">
                <block type="variables_get">
                    <field name="VAR">text</field>
                </block>
            </value>
            <value name="FIND">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        <block type="text_charAt">
            <value name="VALUE">
                <block type="variables_get">
                    <field name="VAR">text</field>
                </block>
            </value>
        </block>
        <block type="text_getSubstring">
            <value name="STRING">
                <block type="variables_get">
                    <field name="VAR">text</field>
                </block>
            </value>
        </block>
        <block type="text_changeCase">
            <value name="TEXT">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        <block type="text_trim">
            <value name="TEXT">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        <block type="text_print">
            <value name="TEXT">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        <block type="text_prompt_ext">
            <value name="TEXT">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
    </category>
    {{--<category id="catLists" colour="260" name="Listas">--}}
        {{--<block type="lists_create_with">--}}
            {{--<mutation items="0"></mutation>--}}
        {{--</block>--}}
        {{--<block type="lists_create_with"></block>--}}
        {{--<block type="lists_repeat">--}}
            {{--<value name="NUM">--}}
                {{--<shadow type="math_number">--}}
                    {{--<field name="NUM">5</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
        {{--</block>--}}
        {{--<block type="lists_length"></block>--}}
        {{--<block type="lists_isEmpty"></block>--}}
        {{--<block type="lists_indexOf">--}}
            {{--<value name="VALUE">--}}
                {{--<block type="variables_get">--}}
                    {{--<field name="VAR">list</field>--}}
                {{--</block>--}}
            {{--</value>--}}
        {{--</block>--}}
        {{--<block type="lists_getIndex">--}}
            {{--<value name="VALUE">--}}
                {{--<block type="variables_get">--}}
                    {{--<field name="VAR">list</field>--}}
                {{--</block>--}}
            {{--</value>--}}
        {{--</block>--}}
        {{--<block type="lists_setIndex">--}}
            {{--<value name="LIST">--}}
                {{--<block type="variables_get">--}}
                    {{--<field name="VAR">list</field>--}}
                {{--</block>--}}
            {{--</value>--}}
        {{--</block>--}}
        {{--<block type="lists_getSublist">--}}
            {{--<value name="LIST">--}}
                {{--<block type="variables_get">--}}
                    {{--<field name="VAR">list</field>--}}
                {{--</block>--}}
            {{--</value>--}}
        {{--</block>--}}
        {{--<block type="lists_split">--}}
            {{--<value name="DELIM">--}}
                {{--<shadow type="text">--}}
                    {{--<field name="TEXT">,</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
        {{--</block>--}}
        {{--<block type="lists_sort"></block>--}}
    {{--</category>--}}
    {{--<category id="catColour" colour="20" name="Colores">--}}
        {{--<block type="colour_picker"></block>--}}
        {{--<block type="colour_random"></block>--}}
        {{--<block type="colour_rgb">--}}
            {{--<value name="RED">--}}
                {{--<shadow type="math_number">--}}
                    {{--<field name="NUM">100</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
            {{--<value name="GREEN">--}}
                {{--<shadow type="math_number">--}}
                    {{--<field name="NUM">50</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
            {{--<value name="BLUE">--}}
                {{--<shadow type="math_number">--}}
                    {{--<field name="NUM">0</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
        {{--</block>--}}
        {{--<block type="colour_blend">--}}
            {{--<value name="COLOUR1">--}}
                {{--<shadow type="colour_picker">--}}
                    {{--<field name="COLOUR">#ff0000</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
            {{--<value name="COLOUR2">--}}
                {{--<shadow type="colour_picker">--}}
                    {{--<field name="COLOUR">#3333ff</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
            {{--<value name="RATIO">--}}
                {{--<shadow type="math_number">--}}
                    {{--<field name="NUM">0.5</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
        {{--</block>--}}
    {{--</category>--}}
    <sep></sep>
    <category id="catVariables" colour="330" custom="VARIABLE" name="Variables"></category>

    <category id="catFunctions" colour="290" custom="PROCEDURE" name="Funciones"></category>
</xml>

<xml id="toolbox2" style="display: none">
    <category id="category-logic" colour="210" name="Logica">
        <block id="block-if" type="controls_if"></block>
        <block id="block-compare" type="logic_compare"></block>
        <block id="block-operation" type="logic_operation"></block>
        <block id="block-negate" type="logic_negate"></block>
        <block id="block-boolean" type="logic_boolean"></block>
        <block id="block-null" type="logic_null"></block>
        <block id="block-ternary" type="logic_ternary"></block>
    </category>
    <category id="category-loops" colour="120" name="Ciclos">
        <block id="block-whileNum" type="controls_repeat_ext">
            <value name="TIMES">
                <shadow type="math_number">
                    <field name="NUM">10</field>
                </shadow>
            </value>
        </block>
        <block id="block-while" type="controls_whileUntil"></block>
        <block id="block-for" type="controls_for">
            <value name="FROM">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="TO">
                <shadow type="math_number">
                    <field name="NUM">10</field>
                </shadow>
            </value>
            <value name="BY">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
        </block>
        <block id="block-forEach" type="controls_forEach"></block>
        <block id="block-break" type="controls_flow_statements"></block>
    </category>
    <category id="category-math" colour="230" name="Matemática">
        <block id="block-number" type="math_number"></block>
        <block id="block-arithmetic" type="math_arithmetic">
            <value name="A">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="B">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
        </block>
        <block id="block-" type="math_single">
            <value name="NUM">
                <shadow type="math_number">
                    <field name="NUM">9</field>
                </shadow>
            </value>
        </block>
        <block id="block-trigonometry" type="math_trig">
            <value name="NUM">
                <shadow type="math_number">
                    <field name="NUM">45</field>
                </shadow>
            </value>
        </block>
        <block id="block-constants" type="math_constant"></block>
        <block id="block-numberProperties" type="math_number_property">
            <value name="NUMBER_TO_CHECK">
                <shadow type="math_number">
                    <field name="NUM">0</field>
                </shadow>
            </value>
        </block>
        <block id="block-change" type="math_change">
            <value name="DELTA">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
        </block>
        <block id="block-round" type="math_round">
            <value name="NUM">
                <shadow type="math_number">
                    <field name="NUM">3.1</field>
                </shadow>
            </value>
        </block>
        <block id="block-mathOnList" type="math_on_list"></block>
        <block id="block-modulo" type="math_modulo">
            <value name="DIVIDEND">
                <shadow type="math_number">
                    <field name="NUM">64</field>
                </shadow>
            </value>
            <value name="DIVISOR">
                <shadow type="math_number">
                    <field name="NUM">10</field>
                </shadow>
            </value>
        </block>
        <block id="block-constraint" type="math_constrain">
            <value name="VALUE">
                <shadow type="math_number">
                    <field name="NUM">50</field>
                </shadow>
            </value>
            <value name="LOW">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="HIGH">
                <shadow type="math_number">
                    <field name="NUM">100</field>
                </shadow>
            </value>
        </block>
        <block id="block-random" type="math_random_int">
            <value name="FROM">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="TO">
                <shadow type="math_number">
                    <field name="NUM">100</field>
                </shadow>
            </value>
        </block>
        <block id="block-randomFloat" type="math_random_float"></block>
    </category>
    <category id="category-text" colour="160" name="Texto">
        <block id="block-string" type="text"></block>
        <block id="block-console" type="text_console"></block>
        <block id="block-stringJoin" type="text_join"></block>
        <block id="block-append" type="text_append">
            <value name="TEXT">
                <shadow type="text"></shadow>
            </value>
        </block>
        <block id="block-stringLength" type="text_length">
            <value name="VALUE">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        <block id="block-isEmpty" type="text_isEmpty">
            <value name="VALUE">
                <shadow type="text">
                    <field name="TEXT"></field>
                </shadow>
            </value>
        </block>
        <block id="block-indexOf" type="text_indexOf">
            <value name="VALUE">
                <block id="block-" type="variables_get">
                    <field name="VAR">text</field>
                </block>
            </value>
            <value name="FIND">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        <block id="block-charAt" type="text_charAt">
            <value name="VALUE">
                <block id="block-" type="variables_get">
                    <field name="VAR">text</field>
                </block>
            </value>
        </block>
        <block id="block-substring" type="text_getSubstring">
            <value name="STRING">
                <block id="block-" type="variables_get">
                    <field name="VAR">text</field>
                </block>
            </value>
        </block>
        <block id="block-changeCase" type="text_changeCase">
            <value name="TEXT">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        <block id="block-trim" type="text_trim">
            <value name="TEXT">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
        {{--<block id="block-" type="text_print">--}}
            {{--<value name="TEXT">--}}
                {{--<shadow type="text">--}}
                    {{--<field name="TEXT">abc</field>--}}
                {{--</shadow>--}}
            {{--</value>--}}
        {{--</block>--}}
        <block id="block-prompt" type="text_prompt_ext">
            <value name="TEXT">
                <shadow type="text">
                    <field name="TEXT">abc</field>
                </shadow>
            </value>
        </block>
    </category>
    <sep></sep>
    <category id="category-variables" colour="330" custom="VARIABLE" name="Variables"></category>
    <category id="category-functions" colour="290" custom="PROCEDURE" name="Funciones"></category>
    <block id="block-variableGet" type="variables_get">
    </block>
    <block id="block-variableSet" type="variables_set">
    </block>
</xml>