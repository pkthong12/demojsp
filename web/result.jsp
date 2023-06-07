<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
    <head>
        <title>Checkbox 08</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body class="justify-content-center py-5 px-4 px-lg-5 mt-5 d-flex">
        <label>Maintained &nbsp;</label>

        <div class="form-check form-switch ">
            <input onchange="change()" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked"
                   <c:if test="${requestScope.stt == 1}"> checked </c:if>  />
            <label class="form-check-label" for="flexSwitchCheckChecked"> Ready </label>
        </div>
    </body>
</html>

<script>
    const stt = document.querySelector("#flexSwitchCheckChecked");
    function change()
    {
        if (stt.checked === true) {
            window.location = 'change?stt=1';
        } else {
            window.location = 'change?stt=0';

        }
    }
</script>