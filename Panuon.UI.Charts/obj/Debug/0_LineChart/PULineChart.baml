   M S B A M L   `   `   `  ����K  GPanuon.UI.Charts, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Panuon.UI.ChartsPanuon.UI.Charts  5      "    Panuon.UI.Charts.PULineChart   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:Panuon.UI.Charts     5      $	��300��5      $	��500��6,   .��5      �   � RowDefinitions  5	   
   �� 5
      $��* �6   6)   �� 5      $��30 �6   6*    � ColumnDefinitions 5   
   �� 5      $��80 �6   6,   �� 5      $��* �6   6+   .+�5   
   � .+�5      �� -   5         ��Name$ 
YAxisCells��5       �� Orientation$ Vertical=�6-   $��RightToLeft=�6D   $��
0, 8, 5,-8q�6`   5      5      � 5   
   $��1��6   }�. .+�5      F� -   5         F�Name$ gridPath��5      $	��0.5��6%   6=   � 5      -   5         �Name$ polyline��5       J� RenderTransformOrigin$ 0.5,1&�6)   6I   � 5      -   5         �Name$ polygon��5      $ 0.5,0.9&�6'   $��0��6G   ��5      �� 5       �� EndPoint$ 0.5,1&�6*   	 �� 
StartPoint$	 0.5,0&�6;   .��5      � 
 � Color$
 	#77686868��6'    � Offset$ 0Q�69   � 5      $
 	#77FFFFFF��6'   $ 1Q�69   5      5      �� 5       -   5         ��Name$ pointCanvas��5       6,   5!      � 5"   
   $��1��6   .+�5#      �� -   5         ��Name$ lblOriginCell��5#      6-   5$      � 5%   
   $��1��6   $��1��6   $��-8,0,0,0q�6,   .+�5&      �� -   5        $ 
XAxisCells��5&      $ 
Horizontal=�6-   5'      5(      5)      