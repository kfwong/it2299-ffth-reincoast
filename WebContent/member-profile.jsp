<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

<!-- header.jsp -->
<jsp:include page="header.jsp">
        <jsp:param value="/path/to/css1" name="css" />
        <jsp:param value="/path/to/css2" name="css" />

</jsp:include>
<!-- header.jsp -->
<style type="text/css">
.button {
        margin: .4em;
        padding: 1em;
        cursor: pointer;
        background: #000000;
        text-decoration: none;
        color: #666666;
}

/* Bubble Float Bottom */
.bubble-float-bottom {
        display: inline-block;
        position: relative;
        transition-duration: 0.3s;
        transition-property: transform;
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        transform: translateZ(0);
        box-shadow: 0 0 1px rgba(0, 0, 0, 0);
}

.bubble-float-bottom:before {
        pointer-events: none;
        position: absolute;
        z-index: -1;
        content: '';
        left: calc(50% - 10px);
        bottom: 0;
        border-style: solid;
        border-width: 10px 10px 0 10px;
        border-color: #000 transparent transparent transparent;
        transition-duration: 0.3s;
        transition-property: bottom;
}

.bubble-float-bottom:hover {
        transform: translateY(-5px) translateZ(0);
}

.bubble-float-bottom:hover:before {
        bottom: -10px;
}
}
</style>

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">



        <div class="button bubble-float-bottom">Bubble Float Bottom</div>
        <br> <br>
        <div class="panel panel-default">
                <div class="panel-body">
                
                
                             <div class="table-responsive">
                                        <table class="table">
                                                <thead>
                                                </thead>


                                                <tr>
                                                        <th>Name</th>
                                                        <th><small> ${member_data.name }</small></th>
                                                        

                                                </tr>

                                                <tr>
                                                        <th>NRIC</th>
                                                        <th><small> ${member_data.nric }</small></th>
                                                </tr>

                                                <tr>
                                                        <th>Gender</th>
                                                        <th><small> ${member_data.gender }</small></th>
                                                </tr>

                                                <tr>
                                                        <th>Address</th>
                                                        <th><small> ${member_data.address} Singapore ${member_data.postalCode} </small></th>

                                                </tr>

                                                <tr>
                                                        <th>Email</th>
                                                        <th><small> ${member_data.email }</small></th>
                                                </tr>

                                                <tr>
                                                        <th>UserName</th>
                                                        <th><small> ${member_data.userName }</small></th>
                                                </tr>

                                                <tr>
                                                        <th>Password</th>
                                                        <th>Change password in Edit profile</th>
                                                </tr>

                                                <tr>
                                                        <th><a class="btn btn-default" href="MemberEditProfileServlet">Modify Profile</a>
                                                        <th><a class="btn btn-default" href="MemberDeactivateServlet">Delete My Account</a>
                                                        
                                                    
                                                        <th>
                                                </tr>


                                        </table>

                                </div>

                    
        </div>

                </div>
        </div>

<!-- sample-content.jsp -->
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
        <jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->