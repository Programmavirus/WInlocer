@echo off
powershell -WindowStyle Hidden -Command ^
  "Add-Type -AssemblyName System.Windows.Forms; ^
   Add-Type -AssemblyName System.Drawing; ^
   $form = New-Object System.Windows.Forms.Form; ^
   $form.Text = 'Система'; ^
   $form.Size = New-Object System.Drawing.Size(300,150); ^
   $form.StartPosition = 'CenterScreen'; ^
   $form.FormBorderStyle = 'FixedDialog'; ^
   $form.MaximizeBox = $false; ^
   $form.MinimizeBox = $false; ^
   $form.TopMost = $true; ^
   $label = New-Object System.Windows.Forms.Label; ^
   $label.Text = 'Введите код:'; ^
   $label.Location = New-Object System.Drawing.Point(20,20); ^
   $label.Size = New-Object System.Drawing.Size(250,20); ^
   $form.Controls.Add($label); ^
   $box = New-Object System.Windows.Forms.TextBox; ^
   $box.Location = New-Object System.Drawing.Point(20,50); ^
   $box.Size = New-Object System.Drawing.Size(240,25); ^
   $box.PasswordChar = '*'; ^
   $form.Controls.Add($box); ^
   $btn = New-Object System.Windows.Forms.Button; ^
   $btn.Text = 'OK'; ^
   $btn.Location = New-Object System.Drawing.Point(100,85); ^
   $btn.Size = New-Object System.Drawing.Size(80,25); ^
   $btn.Add_Click({ if ($box.Text -eq '3721') { $form.Close() } else { $box.Clear(); [System.Windows.Forms.MessageBox]::Show('Неверный код') } }); ^
   $form.Controls.Add($btn); ^
   $form.AcceptButton = $btn; ^
   $form.Add_FormClosing({ if ($box.Text -ne '3721') { $_.Cancel = $true } }); ^
   [void]$form.ShowDialog()"