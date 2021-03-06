﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace Panuon.UI
{
    public class PUComboBox : ComboBox
    {

        static PUComboBox()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(PUComboBox), new FrameworkPropertyMetadata(typeof(PUComboBox)));
        }


        #region RoutedEvent
        /// <summary>
        /// 用户点击删除按钮事件。
        /// </summary>
        public static readonly RoutedEvent DeleteItemEvent = EventManager.RegisterRoutedEvent("DeleteItem", RoutingStrategy.Bubble, typeof(RoutedPropertyChangedEventHandler<PUComboBoxItem>), typeof(PUComboBoxItem));
        public event RoutedPropertyChangedEventHandler<PUComboBoxItem> DeleteItem
        {
            add { AddHandler(DeleteItemEvent, value); }
            remove { RemoveHandler(DeleteItemEvent, value); }
        }
        internal void OnDeleteItem(PUComboBoxItem oldItem, PUComboBoxItem newItem)
        {
            RoutedPropertyChangedEventArgs<PUComboBoxItem> arg = new RoutedPropertyChangedEventArgs<PUComboBoxItem>(oldItem, newItem, DeleteItemEvent);
            RaiseEvent(arg);
        }

        #endregion

        #region Property
        /// <summary>
        /// 圆角大小，默认值为3。
        /// </summary>
        public CornerRadius BorderCornerRadius
        {
            get { return (CornerRadius)GetValue(BorderCornerRadiusProperty); }
            set { SetValue(BorderCornerRadiusProperty, value); }
        }
        public static readonly DependencyProperty BorderCornerRadiusProperty = DependencyProperty.Register("BorderCornerRadius", typeof(CornerRadius), typeof(PUComboBox), new PropertyMetadata(new CornerRadius(3)));

        /// <summary>
        ///  下拉框激活时阴影的颜色，默认值为#888888。
        /// </summary>
        public Color ShadowColor
        {
            get { return (Color)GetValue(CoverBrushProperty); }
            set { SetValue(CoverBrushProperty, value); }
        }
        public static readonly DependencyProperty CoverBrushProperty = DependencyProperty.Register("ShadowColor", typeof(Color), typeof(PUComboBox), new PropertyMetadata((Color)ColorConverter.ConvertFromString("#888888")));

        /// <summary>
        /// 当子项目得到删除按钮可见时，用户点击删除按钮后的操作。默认为删除项目并触发DeleteItem路由事件。
        /// </summary>
        public DeleteModes DeleteMode
        {
            get { return (DeleteModes)GetValue(DeleteModeProperty); }
            set { SetValue(DeleteModeProperty, value); }
        }

        public static readonly DependencyProperty DeleteModeProperty =
            DependencyProperty.Register("DeleteMode", typeof(DeleteModes), typeof(PUComboBoxItem), new PropertyMetadata(DeleteModes.DeleteItem));

        public enum DeleteModes
        {
            /// <summary>
            /// 当用户点击删除按钮时，不直接删除项目（只触发DeleteItem路由事件）。
            /// </summary>
            None,
            /// <summary>
            /// 当用户点击删除按钮时，删除项目并触发DeleteItem路由事件。
            /// </summary>
            DeleteItem,
        }


        /// <summary>
        /// 若使用MVVM绑定，请使用此依赖属性。
        /// </summary>
        public ObservableCollection<PUComboBoxItemModel> BindingItems
        {
            get { return (ObservableCollection<PUComboBoxItemModel>)GetValue(BindingItemsProperty); }
            set { SetValue(BindingItemsProperty, value); }
        }

        public static readonly DependencyProperty BindingItemsProperty =
            DependencyProperty.Register("BindingItems", typeof(ObservableCollection<PUComboBoxItemModel>), typeof(PUComboBox), new PropertyMetadata(null, OnBindingItemsChanged));

        private static void OnBindingItemsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var comboBox = d as PUComboBox;
            var items = comboBox.BindingItems;
            if (items == null)
                return;
            comboBox.Items.Clear();

            foreach (var item in items)
            {
                var comboBoxItem = new PUComboBoxItem()
                {
                    Content = item.Header,
                    Value = item.Value,
                    IsDeleteButtonShow = item.CanDelete,
                };
               
                if (item.CoverBrush != null)
                    comboBoxItem.CoverBrush = item.CoverBrush;
                if (item.SelectedBrush != null)
                    comboBoxItem.SelectedBrush = item.SelectedBrush;

                comboBoxItem.Selected += delegate
                {
                    if (comboBox.SelectedValuePath == SelectedValuePaths.Header)
                        comboBox.SelectedValue = comboBoxItem.Content.ToString();
                    else
                        comboBox.SelectedValue = comboBoxItem.Value;
                };

                if (comboBox.Items.Count == 0)
                    comboBoxItem.IsSelected = true;
                comboBox.Items.Add(comboBoxItem);
            }
        }


        /// <summary>
        /// 该属性指定了当子项目被选中时，SelectedValue应呈现子项目的哪一个值。
        /// 可选项为Header或Value，默认值为Header。
        /// </summary>
        public new SelectedValuePaths SelectedValuePath
        {
            get { return (SelectedValuePaths)GetValue(SelectedValuePathProperty); }
            set { SetValue(SelectedValuePathProperty, value); }
        }

        public new static readonly DependencyProperty SelectedValuePathProperty =
            DependencyProperty.Register("SelectedValuePath", typeof(SelectedValuePaths), typeof(PUComboBox), new PropertyMetadata(SelectedValuePaths.Header));


        /// <summary>
        /// 获取被选中PUComboBoxItem的Header或Value属性（这取决于SelectedValuePath），
        /// 或根据设置的SelectedValue来选中子项目。
        /// </summary>
        public new object SelectedValue
        {
            get { return (object)GetValue(SelectedValueProperty); }
            set { SetValue(SelectedValueProperty, value); }
        }

        public new static readonly DependencyProperty SelectedValueProperty =
            DependencyProperty.Register("SelectedValue", typeof(object), typeof(PUComboBox), new PropertyMetadata("", OnSelectedValueChanged));

        private static void OnSelectedValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var comboBox = d as PUComboBox;
            if (comboBox.SelectedValue == null)
                return;
            var selectedItem = comboBox.SelectedItem as PUComboBoxItem;

            if (selectedItem == null)
            {
                foreach (var item in comboBox.Items)
                {
                    var comboBoxItem = item as PUComboBoxItem;
                    if ((comboBox.SelectedValuePath == SelectedValuePaths.Header ?
                        (comboBoxItem.Content == null ? false : comboBoxItem.Content.ToString() == comboBox.SelectedValue.ToString()) :
                        (comboBoxItem.Value == null ? false : comboBoxItem.Value.Equals(comboBox.SelectedValue))))
                    {
                        if (!comboBoxItem.IsSelected)
                            comboBoxItem.IsSelected = true;
                        return;
                    }
                }
            }

        }



        #endregion

        public enum SelectedValuePaths
        {
            Value, Header
        }
    }
}
