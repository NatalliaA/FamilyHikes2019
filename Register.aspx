<%@ Page Title="Sign up" Language="C#" MasterPageFile="~/Master/Hikes.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="FamilyHikes2019.Register" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" container-fluid">
        <div class="row">
            <div class="col-lg-4 col-xl-4 col-md-6 ml-lg-5 ml-xl-5">
            
                <asp:CreateUserWizard ID="RegisterUser" runat="server"
                    OnCreatedUser="RegisterUser_CreatedUser" CssClass="col-lg-12 col-xl-12"                    
                    EnableViewState="false">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
                        <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
                    </LayoutTemplate>
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                            <ContentTemplate>
                                <div class="form-group" runat="server">
                                    <h3>Sign up</h3>
                                    <p class="failureNotification" style="color: red">
                                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                                    </p>

                                    <p class="mb-1">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </p>
                                    <p>
                                        <span class="d-block">
                                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control">
                                            </asp:TextBox>
                                            </span>
                                            <span class="d-block"><asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                                ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ForeColor="Red">User Name is required.</asp:RequiredFieldValidator>
                                    </span></p>
                                    <p class="mb-1">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                    </p>
                                    <p>
                                      <span class="d-block"><asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                                          </span>
                                       <span class="d-block"><asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                            ErrorMessage="E-mail is required." ToolTip="E-mail is required."
                                            ValidationGroup="RegisterUserValidationGroup" ForeColor="Red" Display="Dynamic">E-mail is required.</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                                            ErrorMessage="Enter a valid E-mail address"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="RegisterUserValidationGroup"
                                            ForeColor="Red" Display="Dynamic">
                                        </asp:RegularExpressionValidator>
                                           </span>
                                    </p>

                                    <p class="mb-1">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </p>
                                    <p>
                                       <span class="d-block"><asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                           </span>
                                         <span class="d-block"><asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                            ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ForeColor="Red">Password is required.</asp:RequiredFieldValidator>
                                  </span></p>
                                    <p class="mb-1">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                    </p>
                                    <p>
                                       <span class="d-block"><asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control"
                                            TextMode="Password"></asp:TextBox></span>
                                     <span class="d-block"><asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification"
                                            Display="Dynamic"
                                            ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server"
                                            ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup"
                                            ForeColor="Red">Confirm Password is required.</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                            ControlToValidate="ConfirmPassword"
                                            CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                            ValidationGroup="RegisterUserValidationGroup" ForeColor="Red">The Password and Confirmation Password must match.</asp:CompareValidator>
                                   </span></p>
                                    <%--<p>
                                            <asp:Label ID="lbl_question" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                            <asp:TextBox ID="Question" runat="server" CssClass="form-control" Width="220px" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                                CssClass="failureNotification" ErrorMessage="Security question is required." ToolTip="Security question is required."
                                                ValidationGroup="RegisterUserValidationGroup" ForeColor="Red">Security question is required.</asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:Label ID="lbl_answer" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                            <asp:TextBox ID="Answer" runat="server" CssClass="form-control" Width="220px" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                                CssClass="failureNotification" ErrorMessage="Security question is required." ToolTip="Security question is required."
                                                ValidationGroup="RegisterUserValidationGroup" ForeColor="Red">Security answer is required.</asp:RequiredFieldValidator>
                                        </p>--%>

                                    <p>
                                        <asp:Button ID="CreateUserButton" runat="server" CssClass="btn btn-success mb-2"
                                            CommandName="MoveNext" Text="Sign up"
                                            ValidationGroup="RegisterUserValidationGroup" />
                                    </p>
                                </div>
                                <p>
                                    Already a member?
                                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Login.aspx" runat="server">Log in</asp:HyperLink>
                                </p>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                            </CustomNavigationTemplate>
                        </asp:CreateUserWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </div>
        </div>
    </div>
</asp:Content>
