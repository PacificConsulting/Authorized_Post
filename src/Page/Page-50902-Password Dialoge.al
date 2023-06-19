page 50902 "Password Detail"
{
    ApplicationArea = All;
    Caption = 'Password Detail';
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            group("Access Detail")
            {
                field(Password; Password)
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
            }
        }
    }
    var
        UserID: Code[50];
        Password: Text[10];
        EmployeeName: Text[30];


    procedure ReturnUserID(): Code[50]
    begin
        exit(USERID);
    end;

    procedure ReturnPassword(): Text[20]
    begin
        exit(Password);
    end;

    procedure ReturnName(): Text[30]
    begin
        exit(EmployeeName);
    end;

}
