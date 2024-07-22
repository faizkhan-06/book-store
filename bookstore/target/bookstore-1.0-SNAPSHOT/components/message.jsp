<%-- message.jsp --%>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
<style>
    /* Styles for the message box */
    .message-box {
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 20px;
        text-align: center;
        /* Remove position: absolute */
        /* top: -80px; Adjust as needed for positioning */
        /* left: 50%; */
        /* transform: translateX(-50%); */
        display: block;
        z-index: 1; /* Ensure the message box is on top */
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        margin-top: 20px; /* Margin to push content below the message box */
    }

    .message-box p {
        font-size: 18px;
        color: #333333;
        margin: 0;
    }

    /* Styles for the close icon */
    .close-icon {
        float: right; /* Float the icon to the right */
        cursor: pointer;
        font-size: 15px;
        color: #333333;
        border-radius: 5px;
        background-color: transparent;
        border: 1px solid #333333;
        width: 20px;
        height: 20px;
        text-align: center;
        line-height: 23px;
    }

    .close-icon:hover {
        background-color: #ff5555; /* Red background on hover */
        color: #ffffff;
    }
</style>

<div class="message-box" id="message-box">
    <span class="close-icon" id="close-message-box">×</span>
    <p><%= message%></p>
</div>
<script>
    // Function to hide the message box
    function hideMessageBox() {
        var messageBox = document.getElementById("message-box");
        messageBox.style.display = "none";
    }

    // Get the close icon element
    var closeIcon = document.getElementById("close-message-box");

    // Close the message box when the close icon is clicked
    closeIcon.addEventListener("click", function () {
        hideMessageBox();
    });
</script>
<%
        session.removeAttribute("message");
    }
%>
