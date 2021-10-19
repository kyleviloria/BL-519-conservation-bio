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

	<!-- category index -->
	<xsl:param name="category_index" select="1" />

	<!-- viewport properties -->
	<xsl:param name="viewport_color" select="'white'" />
	<xsl:param name="viewport_opacity" select="0.0" />
	<xsl:param name="viewport_height" select="500" />
	<xsl:param name="viewport_width" select="500" /> 


	<!-- font properties --> 
	<xsl:param name="font_color"             select="'black'" />
	<xsl:param name="font_family"            select="'Times New Roman'" />
	<xsl:param name="font_size"              select="12" />
	<xsl:param name="font_width"             select="$font_size div 2" />
	<xsl:param name="font_descent"           select="$font_size div 10" />
	<xsl:param name="font_weight"            select="'normal'" />
	<xsl:param name="font_style"             select="'normal'" />
	<xsl:param name="font_decoration"        select="'none'" />
	<xsl:param name="font_filter"            select="'none'" />


	<!-- layout properties -->
	<xsl:param name="base_margin"             select="10" />   

	<!-- shadow properties -->
	<xsl:param name="shadow_visible"          select="0"/>
	<xsl:param name="shadow_color"            select="'black'"/>
	<xsl:param name="shadow_offset_x"         select="0"/>
	<xsl:param name="shadow_offset_y"         select="0"/>

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

	<xsl:param name="title_margin"            select="20" />

	<xsl:param name="title_border_visible"      select="1" />
	<xsl:param name="title_border_margin"       select="4" />
	<xsl:param name="title_border_fill_color"   select="'white'" />
	<xsl:param name="title_border_fill_opacity" select="0.6" />
	<xsl:param name="title_border_stroke_color" select="'lightgray'" />
	<xsl:param name="title_border_stroke_width" select="1" />

	<xsl:param name="title" select="''" />

	<!-- legend properties -->
	<xsl:param name="legend_visible"          select="0"/>
	<xsl:param name="legend_color"            select="$font_color" /> 
	<xsl:param name="legend_font_family"      select="$font_family" />
	<xsl:param name="legend_font_size"        select="14" />
	<xsl:param name="legend_font_width"       select="$legend_font_size div 2" />
	<xsl:param name="legend_font_descent"     select="$legend_font_size div 10" />
	<xsl:param name="legend_font_weight"      select="$font_weight" />
	<xsl:param name="legend_font_style"       select="$font_style" />
	<xsl:param name="legend_font_decoration"  select="$font_decoration" />
	<xsl:param name="legend_font_filter"      select="$font_filter" />

	<xsl:param name="legend_bullet_size"      select="20" />
	<xsl:param name="legend_bullet_filter"    select="'none'"/>  


	<xsl:param name="legend_rect_fill_color"    select="'white'" /> 
	<xsl:param name="legend_rect_fill_opacity"  select="0.6" />
	<xsl:param name="legend_rect_stroke_color"  select="'gray'" />
	<xsl:param name="legend_rect_stroke_width"  select="2" />
	<xsl:param name="legend_rect_filter"        select="'none'"/>  

	<!-- pie label properties --> 
	<xsl:param name="pie_label_visible"           select="0" /> 
	<xsl:param name="pie_label_color"             select="$font_color" />
	<xsl:param name="pie_label_font_family"       select="$font_family" />
	<xsl:param name="pie_label_font_size"         select="12" />
	<xsl:param name="pie_label_font_width"        select="$pie_label_font_size div 2" />
	<xsl:param name="pie_label_font_descent"      select="$pie_label_font_size div 10" />
	<xsl:param name="pie_label_font_weight"       select="$font_weight" />
	<xsl:param name="pie_label_font_style"        select="$font_style" />
	<xsl:param name="pie_label_font_decoration"   select="$font_decoration" />
	<xsl:param name="pie_label_font_filter"       select="$font_filter" />
	<xsl:param name="pie_label_format"            select="'##0.00%'" />  

	<xsl:param name="pie_label_border_visible"      select="1" />
	<xsl:param name="pie_label_border_margin"       select="3" />
	<xsl:param name="pie_label_border_fill_color"   select="'white'" />
	<xsl:param name="pie_label_border_fill_opacity" select="0.8" />
	<xsl:param name="pie_label_border_stroke_color" select="'lightgray'" />  
	<xsl:param name="pie_label_border_stroke_width" select="1" /> 


	<!-- axis properties --> 
	<xsl:param name="axis_color" select="'black'" />
	<xsl:param name="axis_width" select="1" />

	<!-- grid properties -->
	<xsl:param name="x_grid_color" select="'gray'" />
	<xsl:param name="x_grid_width" select="1" />

	<xsl:param name="y_grid_color" select="'gray'" />
	<xsl:param name="y_grid_width" select="1" />

	<!-- pie properties -->
	<xsl:param name="pie_size_min" select="10"/>
	<xsl:param name="pie_filter"  select="'none'"/>
	<xsl:param name="pie_ellipse"  select="0"/>


	<xsl:param name="pie1_color1" select="'rgb(76,102,160)'"/>
	<xsl:param name="pie1_color2" select="'rgb(76,102,160)'"/>

	<xsl:param name="pie2_color1" select="'rgb(27,49,95)'"/>
	<xsl:param name="pie2_color2" select="'rgb(27,49,95)'"/>

	<xsl:param name="pie3_color1" select="'rgb(16,30,59)'"/>
	<xsl:param name="pie3_color2" select="'rgb(16,30,59)'"/>

	<xsl:param name="pie4_color1" select="'rgb(255,255,0)'"/>
	<xsl:param name="pie4_color2" select="'rgb(128,128,0)'"/>

	<xsl:param name="pie5_color1" select="'rgb(0,255,255)'"/>
	<xsl:param name="pie5_color2" select="'rgb(0,128,128)'"/>

	<xsl:param name="pie6_color1" select="'rgb(255,0,255)'"/>
	<xsl:param name="pie6_color2" select="'rgb(128,0,128)'"/>

	<xsl:param name="pie7_color1" select="'rgb(255,128,0)'"/>
	<xsl:param name="pie7_color2" select="'rgb(128,64,0)'"/>

	<xsl:param name="pie8_color1" select="'rgb(0,0,180)'"/>
	<xsl:param name="pie8_color2" select="'rgb(0,0,100)'"/>

	<xsl:param name="pie_offset1" select="0.95"/>
	<xsl:param name="pie_offset2" select="1"/>

	<xsl:param name="pie_focal_x" select="0"/>
	<xsl:param name="pie_focal_y" select="0"/>

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
	<xsl:param name="filter_shadow_deviation" select="0"/>


	<!-- constants -->
	<xsl:variable name="pi" select="math:constant('PI',6)"/>
	<xsl:variable name="pi2" select="$pi * 2"/>
	<xsl:variable name="piDiv2" select="$pi div 2"/>


	<!-- match root element -->
	<xsl:template match="graph">

		<!-- global constants-->

		<!-- legend properties -->
		<xsl:variable name="legend_max_car" select="exsl4D:max-string-length(legend/v)+2"/>
		<!--<xsl:variable name="legend_max_car" select="10+2"/>-->
		<xsl:variable name="legend_label_width" select="$legend_max_car*$legend_font_width"/>
		<xsl:variable name="legend_box_width" select="number(boolean(legend/v))*($base_margin+$legend_bullet_size+$base_margin+$legend_label_width+$base_margin)"/>
		<xsl:variable name="legend_box_height" select="$base_margin+(($legend_bullet_size+$base_margin)*count(legend/v))"/>

		<xsl:variable name="y_values_count" select="count(y_values)" />

		<!-- graph margins -->
		<xsl:variable name="graph_left_margin" select="$base_margin*2" />
		<xsl:variable name="graph_right_margin" select="(($legend_box_width+$base_margin)*number(boolean(legend/v)))+$base_margin"/>
		<xsl:variable name="graph_top_margin" select="(number(boolean($title))*($title_font_size+$title_margin))+$base_margin" />
		<xsl:variable name="graph_bottom_margin" select="$base_margin*2" />

		<!-- viewbox properties --> 

		<xsl:variable name="temp_viewbox_width" select="exsl4D:max($viewport_width,($pie_size_min+$graph_left_margin+$graph_right_margin))" />
		<xsl:variable name="viewbox_height" select="exsl4D:max($viewport_height,(exsl4D:max($pie_size_min,$legend_box_height)+$graph_top_margin+$graph_bottom_margin))" />
		<xsl:variable name="viewbox_width" select="exsl4D:max($viewbox_height,$temp_viewbox_width)" />

		<!--
			<xsl:variable name="viewbox_width" select="$viewport_width" />
			<xsl:variable name="viewbox_height" select="$viewport_height" />
		-->

		<!-- pie properties -->
		<xsl:variable name="pie_x" select="$graph_left_margin" />
		<xsl:variable name="pie_y" select="$graph_top_margin" />
		<xsl:variable name="pie_width" select="$viewbox_width - $graph_left_margin - $graph_right_margin" />
		<xsl:variable name="pie_height" select="$viewbox_height - $graph_top_margin - $graph_bottom_margin" />
		<xsl:variable name="pie_cx" select="$pie_x+($pie_width div 2)" />
		<xsl:variable name="pie_cy" select="$pie_y+($pie_height div 2)" />
		<xsl:variable name="pie_r"  select="exsl4D:min($pie_width,$pie_height) div 2" />
		<xsl:variable name="pie_scalex" select="(1 - $pie_ellipse)+(($pie_ellipse * ($pie_width div 2)) div $pie_r)" />
		<xsl:variable name="pie_scaley" select="(1 - $pie_ellipse)+(($pie_ellipse * ($pie_height div 2)) div $pie_r)" />
		<xsl:variable name="pie_fx" select="$pie_cx+($pie_focal_x*$pie_r)" />
		<xsl:variable name="pie_fy" select="$pie_cy+($pie_focal_y*$pie_r)" />
		<!--<xsl:variable name="pie_r"  select="$pie_height" />-->

		<!-- legend properties -->
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

		<!-- create svg root element-->
		<svg id="ID_svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 {$viewbox_width} {$viewbox_height}" viewport-fill="{$viewport_color}" viewport-fill-opacity="{$viewport_opacity}">
			<xsl:comment>gradient styles</xsl:comment>
			<defs >
				<xsl:call-template name="bar_gradient_defs">
					<xsl:with-param name="bar1_color1" select="$pie1_color1"/>
					<xsl:with-param name="bar1_color2" select="$pie1_color2"/>
					<xsl:with-param name="bar2_color1" select="$pie2_color1"/>
					<xsl:with-param name="bar2_color2" select="$pie2_color2"/>
					<xsl:with-param name="bar3_color1" select="$pie3_color1"/>
					<xsl:with-param name="bar3_color2" select="$pie3_color2"/>
					<xsl:with-param name="bar4_color1" select="$pie4_color1"/>
					<xsl:with-param name="bar4_color2" select="$pie4_color2"/>
					<xsl:with-param name="bar5_color1" select="$pie5_color1"/>
					<xsl:with-param name="bar5_color2" select="$pie5_color2"/>
					<xsl:with-param name="bar6_color1" select="$pie6_color1"/>
					<xsl:with-param name="bar6_color2" select="$pie6_color2"/>
					<xsl:with-param name="bar7_color1" select="$pie7_color1"/>
					<xsl:with-param name="bar7_color2" select="$pie7_color2"/>
					<xsl:with-param name="bar8_color1" select="$pie8_color1"/>
					<xsl:with-param name="bar8_color2" select="$pie8_color2"/>
				</xsl:call-template>
				<xsl:call-template name="pie_gradient_defs">
					<xsl:with-param name="cx" select="$pie_cx"/>
					<xsl:with-param name="cy" select="$pie_cy"/>
					<xsl:with-param name="fx" select="$pie_fx"/>
					<xsl:with-param name="fy" select="$pie_fy"/>
					<xsl:with-param name="r" select="$pie_r"/>
					<xsl:with-param name="pie1_color1" select="$pie1_color1"/>
					<xsl:with-param name="pie1_color2" select="$pie1_color2"/>
					<xsl:with-param name="pie2_color1" select="$pie2_color1"/>
					<xsl:with-param name="pie2_color2" select="$pie2_color2"/>
					<xsl:with-param name="pie3_color1" select="$pie3_color1"/>
					<xsl:with-param name="pie3_color2" select="$pie3_color2"/>
					<xsl:with-param name="pie4_color1" select="$pie4_color1"/>
					<xsl:with-param name="pie4_color2" select="$pie4_color2"/>
					<xsl:with-param name="pie5_color1" select="$pie5_color1"/>
					<xsl:with-param name="pie5_color2" select="$pie5_color2"/>
					<xsl:with-param name="pie6_color1" select="$pie6_color1"/>
					<xsl:with-param name="pie6_color2" select="$pie6_color2"/>
					<xsl:with-param name="pie7_color1" select="$pie7_color1"/>
					<xsl:with-param name="pie7_color2" select="$pie7_color2"/>
					<xsl:with-param name="pie8_color1" select="$pie8_color1"/>
					<xsl:with-param name="pie8_color2" select="$pie8_color2"/>
					<xsl:with-param name="pie_offset1" select="$pie_offset1"/>
					<xsl:with-param name="pie_offset2" select="$pie_offset2"/>
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
					<xsl:with-param name="shadow_color" select="$shadow_color"/>
					<xsl:with-param name="x1" select="$grad_x1"/>
					<xsl:with-param name="x2" select="$grad_x2"/>
					<xsl:with-param name="y1" select="$grad_y1"/> 
					<xsl:with-param name="y2" select="$grad_y2"/>
					<xsl:with-param name="units" select="$grad_units"/> 
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
				<xsl:if test="$legend_visible" >
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
				</xsl:if>

				<xsl:variable name="y_values_sum"  select="sum(y_values/v[$category_index])" />
				<xsl:comment>set pie global transform</xsl:comment>
				<g transform="translate({$pie_cx},{$pie_cy}) scale({$pie_scalex},{$pie_scaley}) translate({-$pie_cx},{-$pie_cy})">
					<xsl:if test="$shadow_visible" >
						<xsl:comment>draw pie shadow</xsl:comment> 
						<xsl:call-template name="circle_shadow">
							<xsl:with-param name="cx"            select="$pie_cx"/>
							<xsl:with-param name="cy"            select="$pie_cy"/>
							<xsl:with-param name="r"             select="$pie_r"/>
							<xsl:with-param name="dx"            select="$shadow_offset_x"/>
							<xsl:with-param name="dy"            select="$shadow_offset_y"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:comment>draw pie</xsl:comment>
					<g id="ID_pie" filter="{$pie_filter}">
						<!-- iterate on all data types -->
						<xsl:for-each select="y_values/v[$category_index]">
							<xsl:comment>draw pie piece <xsl:value-of select="string(position())"></xsl:value-of></xsl:comment>
							<xsl:choose>
								<xsl:when test="position() = 1">
									<g id="ID_pie_1">
										<xsl:variable name="start_angle" select="3 * $piDiv2" />
										<xsl:variable name="end_angle" select="$start_angle + ((number(text()) * $pi2) div $y_values_sum)" />
										<xsl:call-template name="pie">
											<xsl:with-param name="cx" select="$pie_cx" />
											<xsl:with-param name="cy" select="$pie_cy" />
											<xsl:with-param name="r" select="$pie_r" />
											<xsl:with-param name="start" select="$start_angle" />
											<xsl:with-param name="end" select="$end_angle" />
											<xsl:with-param name="large_arc" select="number(($end_angle - $start_angle) &gt; $pi)" />
											<xsl:with-param name="fill" select="concat('url(#ID_pie_grad',string(position()),')')"/>
										</xsl:call-template>
									</g>
								</xsl:when>
								<xsl:otherwise>
									<g id="ID_pie_{position()}">
										<xsl:variable name="pos" select="position()"/>
										<xsl:variable name="start_angle" select="((sum(../../y_values[position() &lt; $pos]/v[$category_index]) * $pi2) div $y_values_sum) - $piDiv2"/>
										<xsl:variable name="end_angle" select="$start_angle + ((number(text()) * $pi2) div $y_values_sum)"/>
										
										<xsl:call-template name="pie">
											<xsl:with-param name="cx" select="$pie_cx" />
											<xsl:with-param name="cy" select="$pie_cy" />
											<xsl:with-param name="r" select="$pie_r" />
											<xsl:with-param name="start" select="$start_angle" />
											<xsl:with-param name="end" select="$end_angle" />
											<xsl:with-param name="large_arc" select="number(($end_angle - $start_angle) &gt; $pi)" />
											<xsl:with-param name="fill" select="concat('url(#ID_pie_grad',string(position()),')')"/>
										</xsl:call-template>
									</g>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</g>
				</g>

				<!-- iterate on all data types -->
				<xsl:if test="boolean($pie_label_visible)">
					<xsl:comment>draw pie labels</xsl:comment>
					<g id="ID_pie_labels" style="fill:{$pie_label_color};stroke:none;font-family:{$pie_label_font_family};font-size:{$pie_label_font_size}px;font-weight:{$pie_label_font_weight};font-style:{$pie_label_font_style};text-decoration:{$pie_label_font_decoration};filter:{$pie_label_font_filter};text-anchor:middle">
						<xsl:for-each select="y_values/v[$category_index]">
							<xsl:comment>
								draw pie piece label <xsl:value-of select="string(position())"></xsl:value-of>
							</xsl:comment>
							<xsl:choose>
								<xsl:when test="position() = 1">
									<g id="ID_pie_label_1">
										<xsl:variable name="end_angle" select="(number(text()) * $pi2) div $y_values_sum" />
										<xsl:call-template name="pie_label_percent">
											<xsl:with-param name="cx"                   select="$pie_cx" />
											<xsl:with-param name="cy"                   select="$pie_cy" />
											<xsl:with-param name="r"                    select="$pie_r" />
											<xsl:with-param name="sx"                   select="$pie_scalex" />
											<xsl:with-param name="sy"                   select="$pie_scaley" />
											<xsl:with-param name="start"                select="0" />
											<xsl:with-param name="end"                  select="$end_angle" />
											<xsl:with-param name="pi2"                  select="$pi2" />
											<xsl:with-param name="format"               select="$pie_label_format" />

											<xsl:with-param name="font_size"            select="$pie_label_font_size"/>
											<xsl:with-param name="font_descent"         select="$pie_label_font_descent"/>

											<xsl:with-param name="border_visible"       select="$pie_label_border_visible" />
											<xsl:with-param name="border_margin"        select="$pie_label_border_margin" />
											<xsl:with-param name="border_fill_color"    select="$pie_label_border_fill_color" />
											<xsl:with-param name="border_fill_opacity"  select="$pie_label_border_fill_opacity" />
											<xsl:with-param name="border_stroke_color"  select="$pie_label_border_stroke_color" />
											<xsl:with-param name="border_stroke_width"  select="$pie_label_border_stroke_width" />
										</xsl:call-template>
									</g>
								</xsl:when>
								<xsl:otherwise> 
									<g id="ID_pie_label_{position()}">
										<xsl:variable name="pos" select="position()"/>
										<xsl:variable name="start_angle" select="(sum(../../y_values[position() &lt; $pos]/v[$category_index]) * $pi2) div $y_values_sum"/>
										<xsl:variable name="end_angle" select="$start_angle+((number(text()) * $pi2) div $y_values_sum)" />
										<xsl:call-template name="pie_label_percent">
											<xsl:with-param name="cx"                   select="$pie_cx" />
											<xsl:with-param name="cy"                   select="$pie_cy" />
											<xsl:with-param name="r"                    select="$pie_r" />
											<xsl:with-param name="sx"                   select="$pie_scalex" />
											<xsl:with-param name="sy"                   select="$pie_scaley" />
											<xsl:with-param name="start"                select="$start_angle" />
											<xsl:with-param name="end"                  select="$end_angle" />
											<xsl:with-param name="pi2"                  select="$pi2" />
											<xsl:with-param name="format"               select="$pie_label_format" />

											<xsl:with-param name="font_size"            select="$pie_label_font_size"/>
											<xsl:with-param name="font_descent"         select="$pie_label_font_descent"/>

											<xsl:with-param name="border_visible"       select="$pie_label_border_visible" />
											<xsl:with-param name="border_margin"        select="$pie_label_border_margin" />
											<xsl:with-param name="border_fill_color"    select="$pie_label_border_fill_color" />
											<xsl:with-param name="border_fill_opacity"  select="$pie_label_border_fill_opacity" />
											<xsl:with-param name="border_stroke_color"  select="$pie_label_border_stroke_color" />
											<xsl:with-param name="border_stroke_width"  select="$pie_label_border_stroke_width" />
										</xsl:call-template>
									</g>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</g>
				</xsl:if>
			</g>
		</svg>
	</xsl:template>
</xsl:stylesheet>
