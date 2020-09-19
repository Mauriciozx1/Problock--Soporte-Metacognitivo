<div id="wysihtml-toolbar" class="wysihtml-toolbar">
    <a data-wysihtml-command="bold" title="CTRL+B" href="javascript:;" unselectable="on" class="wysihtml-command-active" data-tooltip="Negrita"><i class="material-icons">format_bold</i></a>
    <a data-wysihtml-command="italic" title="CTRL+I" href="javascript:;" unselectable="on" class="wysihtml-command-active" data-tooltip="Cursiva"><i class="material-icons">format_italic</i></a>
    {{--<a data-wysihtml-command="superscript" title="sup" href="javascript:;" unselectable="on">superscript</a>--}}
    {{--<a data-wysihtml-command="subscript" title="sub" href="javascript:;" unselectable="on">subscript</a>--}}
    <a data-wysihtml-command="createLink" href="javascript:;" unselectable="on" data-tooltip="Agregar Enlace"><i class="material-icons">link</i></a>
    <a data-wysihtml-command="removeLink" href="javascript:;" unselectable="on" data-tooltip="Quitar Enlace"><i class="material-icons tooltip-bottom" >block</i></a>
    <a data-wysihtml-command="insertImage" href="javascript:;" unselectable="on" data-tooltip="Agregar Imagen"><i class="material-icons">crop_original</i></a>
    <a data-wysihtml-command="formatBlock" data-wysihtml-command-value="h1" href="javascript:;" unselectable="on" data-tooltip="Título 1">H1</a>
    <a data-wysihtml-command="formatBlock" data-wysihtml-command-value="h2" href="javascript:;" unselectable="on" data-tooltip="Título 2">H2</a>
    <a data-wysihtml-command="formatBlock" data-wysihtml-command-value="h3" href="javascript:;" unselectable="on" data-tooltip="Título 3">H3</a>
    <a data-wysihtml-command="formatBlock" data-wysihtml-command-blank-value="true" href="javascript:;" unselectable="on" class="" data-tooltip="Texto Plano"><i class="material-icons">text_fields</i></a>
    <a data-wysihtml-command="alignLeftStyle" href="javascript:;" unselectable="on"><i class="material-icons">format_align_left</i></a>
    <a data-wysihtml-command="formatBlock" data-wysihtml-command-value="center" href="javascript:;" unselectable="on" data-tooltip="Center"><i class="material-icons">format_align_center</i></a>
    <a data-wysihtml-command="alignRightStyle" href="javascript:;" unselectable="on"><i class="material-icons">format_align_right</i></a>
    <a data-wysihtml-command="insertUnorderedList" href="javascript:;" unselectable="on" class="" data-tooltip="Lista"><i class="material-icons">list</i></a>
    <a data-wysihtml-command="insertOrderedList" href="javascript:;" unselectable="on" data-tooltip="Lista Numerada"><i class="material-icons">format_list_numbered</i></a>
    <a data-wysihtml-command="foreColor" data-wysihtml-command-value="black" href="javascript:;" unselectable="on" data-tooltip="Texto Negro"><i class="material-icons" style="color: black">format_color_text</i></a>
    <a data-wysihtml-command="foreColor" data-wysihtml-command-value="blue" href="javascript:;" unselectable="on" data-tooltip="Texto Azul"><i class="material-icons" style="color: blue">format_color_text</i></a>
    <a data-wysihtml-command="foreColor" data-wysihtml-command-value="green" href="javascript:;" unselectable="on" data-tooltip="Texto Verde"><i class="material-icons" style="color: green">format_color_text</i></a>
    <a data-wysihtml-command="foreColor" data-wysihtml-command-value="red" href="javascript:;" unselectable="on" data-tooltip="Texto Rojo"><i class="material-icons" style="color: red">format_color_text</i></a>
    <a data-wysihtml-command="formatCode" data-wysihtml-command-value="language-html" href="javascript:;" unselectable="on" data-tooltip="Código"><i class="material-icons">code</i></a>
    <a data-wysihtml-command="undo" href="javascript:;" unselectable="on" data-tooltip="Deshacer"><i class="material-icons">undo</i></a>
    <a data-wysihtml-command="redo" href="javascript:;" unselectable="on" data-tooltip="Rehacer"><i class="material-icons">redo</i></a>
    {{--<a data-wysihtml-action="change_view" href="javascript:;" unselectable="on" class="">switch to html view</a>--}}

    <div data-wysihtml-dialog="createLink" style="display: none;">
        <label>
            Link:
            <input data-wysihtml-dialog-field="href" value="http://">
        </label>
        <a data-wysihtml-dialog-action="save">OK</a>&nbsp;<a data-wysihtml-dialog-action="cancel">Cancel</a>
    </div>

    <div data-wysihtml-dialog="insertImage" style="display: none;">
        <label>
            Image:
            <input data-wysihtml-dialog-field="src" value="http://">
        </label>
        <label>
            Align:
            <select data-wysihtml-dialog-field="className">
                <option value="">default</option>
                <option value="wysiwyg-float-left">left</option>
                <option value="wysiwyg-float-right">right</option>
            </select>
        </label>
        <a data-wysihtml-dialog-action="save">OK</a>&nbsp;<a data-wysihtml-dialog-action="cancel">Cancel</a>
    </div>

</div>