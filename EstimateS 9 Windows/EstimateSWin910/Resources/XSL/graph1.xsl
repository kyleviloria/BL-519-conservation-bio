<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                >
  <xsl:import href="graph_common.xsl" />

  <xsl:output method="xml" encoding="UTF-8" indent="yes" media-type="image/svg"/>

  <!-- top-level parameters -->

  <!-- viewport properties --> 
  <xsl:param name="viewport_color" select="'white'" />
  <xsl:param name="viewport_opacity" select="0.0" />
  <xsl:param name="viewport_height" select="500" />
  <xsl:param name="viewport_width" select="0" /> 


  <!-- font properties -->
  <xsl:param name="font_color" select="'black'" />
  <xsl:param name="font_family" select="'Arial'" />
  <xsl:param name="font_size" select="12" />
  <xsl:param name="font_width" select="$font_size div 2" />
  <xsl:param name="font_descent" select="$font_size div 10" />  
  <xsl:param name="font_weight" select="'normal'" />
  <xsl:param name="font_style" select="'normal'" />
  <xsl:param name="font_decoration" select="'none'" />  
  <xsl:param name="font_filter" select="'none'" /> 

  <!-- label format properties -->
  <xsl:param name="label_format_number" select="'############0.###'" />
  <xsl:param name="label_format_date"   select="'1'" />
  <xsl:param name="label_format_time"   select="'1'" />
  
  <xsl:param name="x_label_format_number" select="$label_format_number" />
  <xsl:param name="x_label_format_date"   select="$label_format_date" />
  <xsl:param name="x_label_format_time"   select="$label_format_time" />

  <xsl:param name="y_label_format_number" select="$label_format_number" />
  <xsl:param name="y_label_format_date"   select="$label_format_date" />
  <xsl:param name="y_label_format_time"   select="$label_format_time" />

  <!-- layout properties -->
  <xsl:param name="base_margin" select="10" />

  <!-- title properties -->
  <xsl:param name="title_color"             select="$font_color" />
  <xsl:param name="title_font_family"       select="$font_family" />
  <xsl:param name="title_font_size"         select="20" />
  <xsl:param name="title_font_width"        select="$title_font_size div 2" />
  <xsl:param name="title_font_descent"      select="$title_font_size div 10" />
  <xsl:param name="title_font_weight"       select="'bold'" />
  <xsl:param name="title_font_style"        select="$font_style" />
  <xsl:param name="title_font_decoration"   select="$font_decoration" />
  <xsl:param name="title_font_filter"       select="$font_filter" />

  <xsl:param name="title_margin"            select="$base_margin" />
  
  <xsl:param name="title_border_visible"      select="1" />
  <xsl:param name="title_border_margin"       select="4" />
  <xsl:param name="title_border_fill_color"   select="'white'" />
  <xsl:param name="title_border_fill_opacity" select="0.6" />
  <xsl:param name="title_border_stroke_color" select="'lightgray'" />
  <xsl:param name="title_border_stroke_width" select="1" />

  <xsl:param name="title" select="''" />

  <!-- legend properties -->
  <xsl:param name="legend_color"            select="$font_color" />
  <xsl:param name="legend_font_family"      select="$font_family" />
  <xsl:param name="legend_font_size"        select="12" />
  <xsl:param name="legend_font_width"       select="$legend_font_size div 2" />
  <xsl:param name="legend_font_descent"     select="$legend_font_size div 10" />
  <xsl:param name="legend_font_weight"      select="$font_weight" />
  <xsl:param name="legend_font_style"       select="$font_style" />
  <xsl:param name="legend_font_decoration"  select="$font_decoration" /> 
  <xsl:param name="legend_font_filter"      select="$font_filter" />

  <xsl:param name="legend_bullet_size" select="20" /> 
  <xsl:param name="legend_bullet_filter" select="'none'"/>

  <xsl:param name="legend_rect_fill_color" select="'white'" />
  <xsl:param name="legend_rect_fill_opacity" select="0.6" />
  <xsl:param name="legend_rect_stroke_color" select="'gray'" />
  <xsl:param name="legend_rect_stroke_width" select="1" />
  <xsl:param name="legend_rect_filter" select="'none'"/>

  <!-- x label properties -->
  <xsl:param name="x_label_color"            select="$font_color" />   
  <xsl:param name="x_label_font_family"      select="$font_family" />
  <xsl:param name="x_label_font_size"        select="$font_size" />
  <xsl:param name="x_label_font_width"       select="$x_label_font_size div 2" />
  <xsl:param name="x_label_font_descent"     select="$x_label_font_size div 10" />
  <xsl:param name="x_label_font_weight"      select="$font_weight" />
  <xsl:param name="x_label_font_style"       select="$font_style" />
  <xsl:param name="x_label_font_decoration"  select="$font_decoration" /> 
  <xsl:param name="x_label_font_filter"      select="$font_filter" />

  <xsl:param name="x_label_border_visible"      select="0" />
  <xsl:param name="x_label_border_margin"       select="2" />
  <xsl:param name="x_label_border_fill_color"   select="'white'" />
  <xsl:param name="x_label_border_fill_opacity" select="0.6" />
  <xsl:param name="x_label_border_stroke_color" select="'lightgray'" />
  <xsl:param name="x_label_border_stroke_width" select="1" />

  <!-- y label properties -->
  <xsl:param name="y_label_color"            select="$font_color" />
  <xsl:param name="y_label_font_family"      select="$font_family" />
  <xsl:param name="y_label_font_size"        select="$font_size" />
  <xsl:param name="y_label_font_width"       select="$y_label_font_size div 2" />
  <xsl:param name="y_label_font_descent"     select="$y_label_font_size div 10" />
  <xsl:param name="y_label_font_weight"      select="$font_weight" />
  <xsl:param name="y_label_font_style"       select="$font_style" />
  <xsl:param name="y_label_font_decoration"  select="$font_decoration" />
  <xsl:param name="y_label_font_filter"      select="$font_filter" />

  <xsl:param name="y_label_border_visible"      select="0" />
  <xsl:param name="y_label_border_margin"       select="2" />
  <xsl:param name="y_label_border_fill_color"   select="'white'" />
  <xsl:param name="y_label_border_fill_opacity" select="0.6" />
  <xsl:param name="y_label_border_stroke_color" select="'lightgray'" />
  <xsl:param name="y_label_border_stroke_width" select="1" />

  <!-- background properties -->
  <xsl:param name="background_visible" select="1"/>
  <xsl:param name="background_grad_color1" select="'rgb(192,192,192)'"/>
  <xsl:param name="background_grad_color2" select="'rgb(255,255,255)'"/>
  <xsl:param name="background_grad_color3" select="'rgb(164,164,164)'"/>
  <xsl:param name="background_grad_color4" select="'rgb(255,255,255)'"/>

  <!-- axis properties -->
  <xsl:param name="axis_color" select="'black'" />
  <xsl:param name="axis_y0_color" select="'black'" />
  <xsl:param name="axis_width" select="1" />

  <!-- grid properties -->
  <xsl:param name="x_grid_color" select="'gray'" />
  <xsl:param name="x_grid_width" select="1" />

  <xsl:param name="y_grid_color" select="'gray'" />
  <xsl:param name="y_grid_width" select="1" />

  <!-- column bars properties -->
  <xsl:param name="bar_size" select="30"/>
  <xsl:param name="bar_size_min" select="8"/>
  <xsl:param name="bar_r" select="0"/>
  <xsl:param name="bar_filter" select="'none'"/>

  <xsl:param name="bar1_color1" select="'rgb(0,51,102)'"/>
  <xsl:param name="bar1_color2" select="'rgb(0,26,51)'"/>
  
  <xsl:param name="bar2_color1" select="'rgb(179,112,0)'"/>
  <xsl:param name="bar2_color2" select="'rgb(90,56,0)'"/>

  <xsl:param name="bar3_color1" select="'rgb(85,82,204)'"/>
  <xsl:param name="bar3_color2" select="'rgb(43,41,102)'"/>
  
  <xsl:param name="bar4_color1" select="'rgb(188,204,51)'"/>
  <xsl:param name="bar4_color2" select="'rgb(89,102,26)'"/>

  <xsl:param name="bar5_color1" select="'rgb(115,251,29)'"/>
  <xsl:param name="bar5_color2" select="'rgb(58,126,15)'"/>

  <xsl:param name="bar6_color1" select="'rgb(19,15,180)'"/>
  <xsl:param name="bar6_color2" select="'rgb(10,8,90)'"/>

  <xsl:param name="bar7_color1" select="'rgb(215,72,29)'"/>
  <xsl:param name="bar7_color2" select="'rgb(108,36,15)'"/>

  <xsl:param name="bar8_color1" select="'rgb(64,127,126)'"/>
  <xsl:param name="bar8_color2" select="'rgb(32,64,63)'"/>


  <!-- custom gradients colors -->
  <xsl:param name="grad1_color1" select="'rgb(64,64,64)'"/>
  <xsl:param name="grad1_color2" select="'Snow'"/>

  <xsl:param name="grad2_color1" select="'Snow'"/>
  <xsl:param name="grad2_color2" select="'rgb(64,64,64)'"/>

  <xsl:param name="grad3_color1" select="'blue'"/>
  <xsl:param name="grad3_color2" select="'rgb(0,255,255)'"/>

  <xsl:param name="grad4_color1" select="'rgb(0,255,255)'"/>
  <xsl:param name="grad4_color2" select="'blue'"/>

  <xsl:param name="grad_x1" select="1"/>
  <xsl:param name="grad_x2" select="0"/>
  <xsl:param name="grad_y1" select="1"/>
  <xsl:param name="grad_y2" select="0"/>
  <xsl:param name="grad_units" select="'objectBoundingBox'"/>

  <!-- filter properties -->
  <xsl:param name="filter_shadow_deviation" select="1"/>


  <!-- match root element -->
  <xsl:template match="graph">
    <!-- global constants-->

    <!-- legend properties -->
    <xsl:variable name="legend_max_car" select="exsl4D:max-string-length(legend/v)+2"/>
    <xsl:variable name="legend_label_width" select="$legend_max_car*$legend_font_width"/>
    <xsl:variable name="legend_box_width" select="number(boolean(legend/v[1]))*($base_margin+$legend_bullet_size+$base_margin+$legend_label_width+$base_margin)"/>
    <xsl:variable name="legend_box_height" select="$base_margin+(($legend_bullet_size+$base_margin)*count(legend/v))"/>

    <!-- axis x labels properties -->
    <xsl:variable name="x_values_count" select="count(x_values/v)"/>
    <xsl:variable name="x_label_max_car" select="exsl4D:max-value-length(x_values/v,$x_label_format_number,$x_label_format_date,$x_label_format_time)"/>
    <xsl:variable name="x_label_width" select="$x_label_font_width*$x_label_max_car"/>

    <!-- axis y labels properties -->
    <xsl:variable name="y_label_max_car" select="exsl4D:max-value-length(y_grid_values/v,$y_label_format_number,$y_label_format_date,$y_label_format_time)"/>
    <xsl:variable name="y_label_width" select="$y_label_font_width*$y_label_max_car"/>
    <xsl:variable name="y_label_count" select="count(y_grid_values/v)" />

    <xsl:variable name="y_values_count" select="count(y_values)" />

    <!-- graph margins -->
    <xsl:variable name="graph_left_margin" select="$y_label_width+($base_margin*2)" />
    <xsl:variable name="graph_right_margin" select="(($legend_box_width+$base_margin)*number(boolean(legend/v)))+$base_margin"/>
    <xsl:variable name="graph_top_margin" select="(number(boolean($title))*($title_font_size+$title_margin))+$y_label_font_size+$base_margin" />
    <xsl:variable name="graph_bottom_margin" select="$x_label_font_size+($base_margin*2)" />

    <!-- graph bars properties -->
    <xsl:variable name="bar_prop" select="number($viewport_width &gt; 0)" />
    <xsl:variable name="data_group_width_min" select="exsl4D:max($x_label_width+$base_margin,($base_margin*4)+($bar_size_min*$y_values_count))"/>
    <xsl:variable name="temp_width" select="exsl4D:max($viewport_width,(($data_group_width_min*$x_values_count)+$graph_left_margin+$graph_right_margin))" />
    <xsl:variable name="bar_width" select="($bar_size*(1 - $bar_prop))+((((($temp_width - $graph_left_margin - $graph_right_margin) div $x_values_count) - ($base_margin*4)) div $y_values_count)*$bar_prop)" />
    
    <xsl:variable name="bar_group_width" select="$y_values_count*$bar_width"/>
    <xsl:variable name="data_group_width_base" select="($base_margin*4)+$bar_group_width"/>
    <xsl:variable name="data_group_width" select="exsl4D:max($data_group_width_base,$data_group_width_min)"/>
    <xsl:variable name="bar_group_offset" select="($data_group_width - $bar_group_width) div 2"/>

    <!-- viewbox properties -->
    <xsl:variable name="viewbox_width" select="($data_group_width*$x_values_count)+$graph_left_margin+$graph_right_margin" />
    <xsl:variable name="viewbox_height" select="exsl4D:max($viewport_height,$graph_top_margin+$legend_box_height+$graph_bottom_margin)" />


    <xsl:variable name="legend_box_x" select="$viewbox_width - $graph_right_margin + $base_margin"/>
    <xsl:variable name="legend_box_y" select="$graph_top_margin"/>
    <xsl:variable name="legend_bullet_x" select="$legend_box_x + $base_margin"/>
    <xsl:variable name="legend_bullet_y" select="$legend_box_y + $base_margin"/>
    <xsl:variable name="legend_label_x" select="$legend_bullet_x + $legend_bullet_size + $base_margin"/>
    <xsl:variable name="legend_label_y" select="$legend_bullet_y + $legend_bullet_size - (($legend_bullet_size - $legend_font_size) div 2) - $legend_font_descent"/>
    <xsl:variable name="legend_step_y" select="$legend_bullet_size+$base_margin"/>

    <!-- title properties -->
    <xsl:variable name="title_max_car" select="string-length($title)"/>
    <xsl:variable name="title_label_width" select="$title_max_car*$title_font_width"/>
    <xsl:variable name="title_pos_y" select="$base_margin+$title_font_size" />
    <xsl:variable name="title_pos_x" select="$graph_left_margin + (($viewbox_width - $graph_left_margin - $graph_right_margin) div 2)"/>

    <xsl:variable name="y_max" select="exsl4D:max(y_grid_values/s)"/>
    <xsl:variable name="y_min" select="exsl4D:min(y_grid_values/s)"/>
	<xsl:variable name="y_scale" select="($viewbox_height - $graph_top_margin - $graph_bottom_margin) div exsl4D:max(0.000000000001,$y_max - $y_min)"/>

	  <!-- create svg root element-->
    <svg id="ID_svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 {$viewbox_width} {$viewbox_height}" viewport-fill="{$viewport_color}" viewport-fill-opacity="{$viewport_opacity}">
      <xsl:variable name="y0" select="$viewbox_height - $graph_bottom_margin + ($y_min*$y_scale)" />

      <xsl:comment>gradient styles</xsl:comment>
      <defs >
        <xsl:call-template name="bar_gradient_defs">
          <xsl:with-param name="bar1_color1" select="$bar1_color1"/>
          <xsl:with-param name="bar1_color2" select="$bar1_color2"/>
          <xsl:with-param name="bar2_color1" select="$bar2_color1"/>
          <xsl:with-param name="bar2_color2" select="$bar2_color2"/>
          <xsl:with-param name="bar3_color1" select="$bar3_color1"/>
          <xsl:with-param name="bar3_color2" select="$bar3_color2"/>
          <xsl:with-param name="bar4_color1" select="$bar4_color1"/>
          <xsl:with-param name="bar4_color2" select="$bar4_color2"/>
          <xsl:with-param name="bar5_color1" select="$bar5_color1"/>
          <xsl:with-param name="bar5_color2" select="$bar5_color2"/>
          <xsl:with-param name="bar6_color1" select="$bar6_color1"/>
          <xsl:with-param name="bar6_color2" select="$bar6_color2"/>
          <xsl:with-param name="bar7_color1" select="$bar7_color1"/>
          <xsl:with-param name="bar7_color2" select="$bar7_color2"/>
          <xsl:with-param name="bar8_color1" select="$bar8_color1"/>
          <xsl:with-param name="bar8_color2" select="$bar8_color2"/>
        </xsl:call-template>
        <xsl:call-template name="gradient_defs">
          <xsl:with-param name="grad1_color1" select="$grad1_color1"/>
          <xsl:with-param name="grad1_color2" select="$grad1_color2"/>
          <xsl:with-param name="grad2_color1" select="$grad2_color1"/>
          <xsl:with-param name="grad2_color2" select="$grad2_color2"/>
          <xsl:with-param name="grad3_color1" select="$grad3_color1"/>
          <xsl:with-param name="grad3_color2" select="$grad3_color2"/>
          <xsl:with-param name="grad4_color1" select="$grad4_color1"/>
          <xsl:with-param name="grad4_color2" select="$grad4_color2"/>
          <xsl:with-param name="x1" select="$grad_x1"/>
          <xsl:with-param name="x2" select="$grad_x2"/>
          <xsl:with-param name="y1" select="$grad_y1"/>
          <xsl:with-param name="y2" select="$grad_y2"/>
          <xsl:with-param name="units" select="$grad_units"/>
        </xsl:call-template>
        <xsl:call-template name="bkgd_gradient_defs">
          <xsl:with-param name="color1" select="$background_grad_color1"/>
          <xsl:with-param name="color2" select="$background_grad_color2"/>
          <xsl:with-param name="color3" select="$background_grad_color3"/>
          <xsl:with-param name="color4" select="$background_grad_color4"/>
          <xsl:with-param name="y1" select="$graph_top_margin"/>
          <xsl:with-param name="y2" select="$viewbox_height - $graph_bottom_margin"/>
          <xsl:with-param name="y0" select="$y0"/>
        </xsl:call-template>
        <xsl:call-template name="filter_defs">
          <xsl:with-param name="shadow_deviation" select="$filter_shadow_deviation"/>
        </xsl:call-template>
      </defs>

      <xsl:comment>global stroke and font styles</xsl:comment>
      <g id="ID_globals" style="fill:{$font_color};stroke:none;font-family:{$font_family};font-size:{$font_size}px;font-weight:{$font_weight};font-style:{$font_style};text-decoration:{$font_decoration}">
     
        <xsl:comment>draw title</xsl:comment>
        <xsl:if test="$title_max_car &gt; 0">
          <g id="ID_title" style="fill:{$title_color};stroke:none;font-family:{$title_font_family};font-size:{$title_font_size}px;font-weight:{$title_font_weight};font-style:{$title_font_style};text-decoration:{$title_font_decoration};filter:{$title_font_filter}" >
            <xsl:call-template name="label_align_middle">
              <xsl:with-param name="x"                      select="$title_pos_x" />
              <xsl:with-param name="y"                      select="$title_pos_y" />
              <xsl:with-param name="text"                   select="$title"/>

              <xsl:with-param name="font_size"              select="$title_font_size"/>
              <xsl:with-param name="font_descent"           select="$title_font_descent"/>

              <xsl:with-param name="border_visible"         select="$title_border_visible" />
              <xsl:with-param name="border_margin"          select="$title_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$title_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$title_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$title_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$title_border_stroke_width" />
            </xsl:call-template>
          </g>
        </xsl:if>

        <xsl:comment>draw legend</xsl:comment>
        <xsl:if test="legend/v" >
          <g id="ID_legend" filter="{$legend_rect_filter}">
            <xsl:comment>draw legend border</xsl:comment>
            <xsl:call-template name="legend_border">
              <xsl:with-param name="x" select="$legend_box_x" />
              <xsl:with-param name="y" select="$legend_box_y" />
              <xsl:with-param name="width" select="$legend_box_width" />
              <xsl:with-param name="height" select="$legend_box_height" />
              <xsl:with-param name="fill-color" select="$legend_rect_fill_color" />
              <xsl:with-param name="fill-opacity" select="$legend_rect_fill_opacity" />
              <xsl:with-param name="stroke-color" select="$legend_rect_stroke_color" />
              <xsl:with-param name="stroke-width" select="$legend_rect_stroke_width" />
            </xsl:call-template>
            <xsl:comment>draw legend bullets</xsl:comment>
            <g id="ID_legend_bullets" stroke="NONE">
              <xsl:for-each select="legend/v">
                <xsl:call-template name="legend_bullet">
                  <xsl:with-param name="x" select="$legend_bullet_x" />
                  <xsl:with-param name="y" select="$legend_bullet_y+$legend_step_y*(position()-1)" />
                  <xsl:with-param name="width" select="$legend_bullet_size" />
                  <xsl:with-param name="height" select="$legend_bullet_size" />
                  <xsl:with-param name="fill" select="concat('url(#ID_bar_grad',string(position()),')')" />
                  <xsl:with-param name="filter" select="$legend_bullet_filter" />
                </xsl:call-template>
              </xsl:for-each>
            </g>
            <xsl:comment>draw legend labels</xsl:comment>
            <g id="ID_legend_labels" style="fill:{$legend_color};stroke:none;font-family:{$legend_font_family};font-size:{$legend_font_size}px;font-weight:{$legend_font_weight};font-style:{$legend_font_style};text-decoration:{$legend_font_decoration};filter:{$legend_font_filter};text-anchor:start">
              <xsl:for-each select="legend/v">
                <text x="{$legend_label_x}" y="{$legend_label_y+$legend_step_y*(position()-1)}" >
                  <xsl:value-of select="text()"/>
                </text>
              </xsl:for-each>
            </g>
          </g>
        </xsl:if>

        <xsl:comment>draw graph background</xsl:comment>
        <xsl:if test="$background_visible">
          <xsl:call-template name="graph_background">
            <xsl:with-param name="x" select="$graph_left_margin" />
            <xsl:with-param name="y" select="$graph_top_margin" />
            <xsl:with-param name="width" select="$viewbox_width - $graph_right_margin - $graph_left_margin" />
            <xsl:with-param name="height" select="$viewbox_height - $graph_bottom_margin - $graph_top_margin"/>           
            <xsl:with-param name="y0" select="$y0"/>
            <xsl:with-param name="top_fill" select="'url(#ID_bkgd_grad1)'"/>
            <xsl:with-param name="bottom_fill" select="'url(#ID_bkgd_grad2)'"/>
          </xsl:call-template>
        </xsl:if>
        

        <xsl:comment>draw x grid lines</xsl:comment>
        <xsl:for-each select="settings/x_grid">
          <xsl:if test="text() = 'true'" >
            <g id="ID_x_grid" stroke="{$x_grid_color}" stroke-width="{$x_grid_width}">
              <xsl:for-each select="../../x_values/v">
                <xsl:variable name="x_line_pos" select="$graph_left_margin+($data_group_width*position())" />
                <line x1="{$x_line_pos}" y1="{$graph_top_margin}" x2="{$x_line_pos}" y2="{$viewbox_height - $graph_bottom_margin}"/>
              </xsl:for-each>
            </g>
          </xsl:if>
        </xsl:for-each>


        <xsl:comment>draw y grid lines</xsl:comment>
        <xsl:for-each select="settings/y_grid">
          <xsl:if test="text() = 'true'" >
            <g id="ID_y_grid" stroke="{$y_grid_color}" stroke-width="{$y_grid_width}">
              <xsl:for-each select="../../y_grid_values/s">
                <xsl:variable name="y_line_pos" select="$viewbox_height - $graph_bottom_margin - ((number(text()) - $y_min)*$y_scale)" />
                <line x1="{$graph_left_margin}" y1="{$y_line_pos}" x2="{$viewbox_width - $graph_right_margin}" y2="{$y_line_pos}" />
              </xsl:for-each>
            </g>
          </xsl:if>
        </xsl:for-each>

        <xsl:comment>draw axis x labels</xsl:comment>
        <g id="ID_x_values" style="fill:{$x_label_color};stroke:none;font-family:{$x_label_font_family};font-size:{$x_label_font_size}px;font-weight:{$x_label_font_weight};font-style:{$x_label_font_style};text-decoration:{$x_label_font_decoration};filter:{$x_label_font_filter}">
          <xsl:for-each select="x_values/v">
            <xsl:variable name="pos"
              select="$graph_left_margin+($data_group_width*(position()-1))+($data_group_width div 2)"/>

            <!-- create label text element -->
            <xsl:call-template name="label_align_middle">
              <xsl:with-param name="x"                      select="$pos" />
              <xsl:with-param name="y"                      select="$viewbox_height - $base_margin" />
              <xsl:with-param name="text"                   select="exsl4D:format-value(text(),$x_label_format_number,$x_label_format_date,$x_label_format_time)"/>

              <xsl:with-param name="font_size"              select="$x_label_font_size"/>
              <xsl:with-param name="font_descent"           select="$x_label_font_descent"/>

              <xsl:with-param name="border_visible"         select="$x_label_border_visible" />
              <xsl:with-param name="border_margin"          select="$x_label_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$x_label_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$x_label_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$x_label_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$x_label_border_stroke_width" />
            </xsl:call-template>
           </xsl:for-each>
        </g>

        <xsl:comment>draw axis y labels</xsl:comment>
        <g id="ID_y_grid_values" style="fill:{$y_label_color};stroke:none;font-family:{$y_label_font_family};font-size:{$y_label_font_size}px;font-weight:{$y_label_font_weight};font-style:{$y_label_font_style};text-decoration:{$y_label_font_decoration};filter:{$y_label_font_filter}">
          <xsl:for-each select="y_grid_values/s">
            <xsl:variable name="pos" select="position()" />
            <xsl:call-template name="label_align_right">
              <xsl:with-param name="x"                      select="$base_margin+$y_label_width" />
              <xsl:with-param name="y"                      select="$viewbox_height - $graph_bottom_margin - ((number(text()) - $y_min)*$y_scale) + ($font_size div 2)" />
              <xsl:with-param name="text"                   select="exsl4D:format-value(string(../v[$pos]),$y_label_format_number,$y_label_format_date,$y_label_format_time)"/>

              <xsl:with-param name="font_size"              select="$y_label_font_size"/>
              <xsl:with-param name="font_descent"           select="$y_label_font_descent"/>

              <xsl:with-param name="border_visible"         select="$y_label_border_visible" />
              <xsl:with-param name="border_margin"          select="$y_label_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$y_label_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$y_label_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$y_label_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$y_label_border_stroke_width" />
            </xsl:call-template>
          </xsl:for-each>
        </g>

        <xsl:comment>draw bars</xsl:comment>
        <!-- iterate on data types -->
        <xsl:for-each select="y_values">
          <xsl:comment>draw bars for data type <xsl:value-of select="string(position())"></xsl:value-of>
          </xsl:comment>

          <!-- local variables-->
          <xsl:variable name="y_values_index" select="position()"/>

          <!-- iterate on y numbers -->
          <g id="ID_bars_{position()}" fill="url(#ID_bar_grad{position()})" stroke="none">
            <xsl:for-each select="s">
              <!-- the bar's x position -->
              <xsl:variable name="pos"
                            select="$graph_left_margin+($data_group_width*(position()-1))+$bar_group_offset"/>

              <!-- the bar's height -->
              <xsl:variable name="bar_height" select="math:abs(number(text()))*$y_scale"/>
              
              <!-- the rectangle -->
              <xsl:choose>
                <xsl:when test="$y_min &lt; 0">
                  <xsl:choose>
                    <xsl:when test="number(text()) &gt; 0">
                      <xsl:call-template name="bar_1">
                        <xsl:with-param name="x" select="$pos+$bar_width*(($y_values_index)-1)" />
                        <xsl:with-param name="y" select="$y0 - $bar_height" />
                        <xsl:with-param name="width" select="$bar_width" />
                        <xsl:with-param name="height" select="$bar_height" />
                        <xsl:with-param name="r" select="$bar_r"/>
                        <xsl:with-param name="filter" select="$bar_filter"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="bar_1">
                        <xsl:with-param name="x" select="$pos+$bar_width*(($y_values_index)-1)" />
                        <xsl:with-param name="y" select="$y0" />
                        <xsl:with-param name="width" select="$bar_width" />
                        <xsl:with-param name="height" select="$bar_height" />
                        <xsl:with-param name="r" select="$bar_r"/>
                        <xsl:with-param name="filter" select="$bar_filter"/>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="bar_height2"  select="(number(text()) - $y_min)*$y_scale"/>
                  <xsl:call-template name="bar_1">
                    <xsl:with-param name="x" select="$pos+$bar_width*(($y_values_index)-1)" />
                    <xsl:with-param name="y" select="$viewbox_height - $graph_bottom_margin - $bar_height2" />
                    <xsl:with-param name="width" select="$bar_width" />
                    <xsl:with-param name="height" select="$bar_height2" />
                    <xsl:with-param name="r" select="$bar_r"/>
                    <xsl:with-param name="filter" select="$bar_filter"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </g>
        </xsl:for-each>

        <xsl:comment>draw the axes</xsl:comment>
        <xsl:comment>draw horizontal axes</xsl:comment>
        <g id="ID_x_axis" stroke="{$axis_color}" stroke-width="{$axis_width}" >
          <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$graph_top_margin}" y2="{$graph_top_margin}"/>
          <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$viewbox_height - $graph_bottom_margin}"/>
        </g>
        <xsl:comment>draw y=0 axe</xsl:comment>
        <xsl:if test="$y_min &lt; 0">
          <g id="ID_y0_axis" stroke="{$axis_y0_color}" stroke-width="{$axis_width}" >
            <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$y0}" y2="{$y0}"/>
          </g>
        </xsl:if>
        <xsl:comment>draw vertical axes</xsl:comment>
        <g id="ID_y_axis" stroke="{$axis_color}" stroke-width="{$axis_width}">
          <line x1="{$graph_left_margin}" x2="{$graph_left_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$graph_top_margin}"/>
          <line x1="{$viewbox_width - $graph_right_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$graph_top_margin}"/>
        </g>
      </g>
    </svg>
  </xsl:template>
</xsl:stylesheet>
