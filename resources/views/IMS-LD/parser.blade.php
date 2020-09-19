<html>
    <head>

        <title>IMS-LD Parser</title>

    </head>
    <body>
        Actividad IMS-LD
    </body>
    <xml id="imsld-excercise" style="display: none">
        @include('IMS-LD/exercise')
    </xml>
    {{--SCRIPTS--}}
    <script src="{!! asset('/resources/js/vendor/jquery-2.2.3.min.js') !!}"></script>

    <script>

        $(document).ready(function() {

            window.xml = $('#imsld-excercise');

            //Quitando los marcadores de la especificacion
            xml.html(xml.html().replace(/(imsld:)|(imscp:)/g, ''));

            var pblStoryline = xml.find('activity-structure[identifier=AS-PBL-storyline]');
            var pblStorylineTasks = pblStoryline.find('activity-structure-ref');

            var activityGroups = [];

            for(var i = 0 ; i < pblStorylineTasks.length ; i++) {
                var activityGroup = {};

                activityGroup.id = $(pblStorylineTasks[i]).attr('ref');

                var activityStructure = xml.find('activity-structure[identifier=' + activityGroup.id + ']');

                activityGroup.name = activityStructure.find('title').html();

                activityGroup.activities = [];

                var activities = activityStructure.find('learning-activity-ref');
                for(var e = 0 ; e < activities.length ; e++) {
                    var activity = xml.find('learning-activity[identifier=' + $(activities[e]).attr('ref') + ']');
                    var activityData = {
                        id : $(activities[e]).attr('ref'),
                        name : activity.find('title').html(),
                        resource : activity.find('activity-description>item').attr('identifierref')
                    };

                    activityGroup.activities.push(activityData);
                }

                activityGroups.push(activityGroup);

            }

            console.log(activityGroups);

        });
    </script>
</html>