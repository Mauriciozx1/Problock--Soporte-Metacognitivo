

$(document).ready(function(){


    // Collections
    window.collections.teachers = new CSLP.Admin.Collections.Teachers();
    window.collections.courses = new CSLP.Admin.Collections.Courses();

    //Views
    window.teacherModal = new CSLP.Admin.Views.TeacherModal({
        el : $('#teacher-modal')
    });

    window.teachersPanel = new CSLP.Admin.Views.TeachersPanel({
        el : $('#teachers-section')
    });

    window.coursesPanel = new CSLP.Admin.Views.CoursesPanel({
        el : $('#courses-section')
    });

    //Add initial data
    window.collections.courses.add(window.data.courses);
    window.collections.teachers.add(window.data.teachers);

    window.coursesPanel.changeModel(undefined);


    $('#addTeacher').click(function(){
        window.teacherModal.changeModel(new CSLP.Admin.Models.Teacher);
        window.teacherModal.toggle();
    });

});
