   M S B A M L   `   `   `  ����D  @Panuon.UI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null8*clr-namespace:Panuon.UI;assembly=Panuon.UI	Panuon.UI  5   	    Panuon.UIBrowser+   %Panuon.UIBrowser.Views.MainWindowView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   9pu*clr-namespace:Panuon.UI;assembly=Panuon.UI     5   	   ^ ZCaliburn.Micro.Platform, Version=3.2.0.0, Culture=neutral, PublicKeyToken=8e5891231f2ed21f(calhttp://www.caliburnproject.org  5   	     � Title$  PanuonUI Broswer��5	   	   $	��600��6"   $
��1000��6/    � WindowStartupLocation$ CenterScreen=�6<      Panuon.UI.PUWindow   AnimationStyle$ Gradual=�6a      	ShowDelay .    Icon 5
      �� 5   
   $	����6   $��20(�6      FontAwesome#��[  6+   6W   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��2.2* �6   6.   �� 5      $��8* �6   6,   .+�5   
   � .+�5      ��  �� Orientation$ Vertical=�6   .+�5         Panuon.UI.PURadioButton     RadioButtonStyle$ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��主页��6}    d� 	IsChecked$
 TrueY�6�     Caliburn.Micro.Message	   Attach$.	 ([Event Click]=[Action ChangeSelect('0')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��Window 窗体��6}   $.	 ([Event Click]=[Action ChangeSelect('1')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��Button 按钮��6}   $.	 ([Event Click]=[Action ChangeSelect('2')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��TextBox 输入框��6}   $.	 ([Event Click]=[Action ChangeSelect('3')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��ComboBox 下拉选择框��6}   $.	 ([Event Click]=[Action ChangeSelect('4')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��PasswordBox 密码框��6}   $.	 ([Event Click]=[Action ChangeSelect('5')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��CheckBox 复选框��6}   $.	 ([Event Click]=[Action ChangeSelect('6')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��RadioButton 单选框��6}   $.	 ([Event Click]=[Action ChangeSelect('7')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��TreeView 树视图��6}   $.	 ([Event Click]=[Action ChangeSelect('8')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��ProgressBar 进度条��6}   $.	 ([Event Click]=[Action ChangeSelect('9')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��Special 特殊控件��6}   $/	 )[Event Click]=[Action ChangeSelect('10')]��6�   6�     5      $ Branch=�6#   $��34��6=   $��20,0,0,0q�6I   $��14(�6\   
�������$��LineCharts 折线图��6}   $0	 *[Event Click]=[Action ChangeSelect('101')]��6�   5       5!      �� 5"   
   $��1��6   .��5#      �� -   5        
 ��Name$
 
ActiveItem��5#      64   5$      5%      5&      