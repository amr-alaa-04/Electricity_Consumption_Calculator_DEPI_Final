---
name: Nile Watt Financial
colors:
  surface: '#edfdf3'
  surface-dim: '#ceded4'
  surface-bright: '#edfdf3'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#e7f7ee'
  surface-container: '#e2f2e8'
  surface-container-high: '#dcece2'
  surface-container-highest: '#d6e6dd'
  on-surface: '#111e19'
  on-surface-variant: '#404944'
  inverse-surface: '#26332d'
  inverse-on-surface: '#e5f5eb'
  outline: '#707974'
  outline-variant: '#bfc9c3'
  surface-tint: '#276954'
  primary: '#004131'
  on-primary: '#ffffff'
  primary-container: '#145a46'
  on-primary-container: '#8ecfb6'
  inverse-primary: '#92d4ba'
  secondary: '#006c53'
  on-secondary: '#ffffff'
  secondary-container: '#9af4d4'
  on-secondary-container: '#027259'
  tertiary: '#2a3d36'
  on-tertiary: '#ffffff'
  tertiary-container: '#40544d'
  on-tertiary-container: '#b2c7be'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#aef0d6'
  primary-fixed-dim: '#92d4ba'
  on-primary-fixed: '#002117'
  on-primary-fixed-variant: '#04513d'
  secondary-fixed: '#9af4d4'
  secondary-fixed-dim: '#7ed7b8'
  on-secondary-fixed: '#002117'
  on-secondary-fixed-variant: '#00513e'
  tertiary-fixed: '#d2e7de'
  tertiary-fixed-dim: '#b6cbc2'
  on-tertiary-fixed: '#0c1f19'
  on-tertiary-fixed-variant: '#384b44'
  background: '#edfdf3'
  on-background: '#111e19'
  surface-variant: '#d6e6dd'
typography:
  display-lg:
    fontFamily: IBM Plex Sans
    fontSize: 36px
    fontWeight: '700'
    lineHeight: 44px
  display-lg-mobile:
    fontFamily: IBM Plex Sans
    fontSize: 30px
    fontWeight: '700'
    lineHeight: 38px
  headline-lg:
    fontFamily: IBM Plex Sans
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 36px
  headline-lg-mobile:
    fontFamily: IBM Plex Sans
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  headline-md:
    fontFamily: IBM Plex Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  headline-sm:
    fontFamily: IBM Plex Sans
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: IBM Plex Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: IBM Plex Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: IBM Plex Sans
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-lg:
    fontFamily: IBM Plex Sans
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  label-md:
    fontFamily: IBM Plex Sans
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
  label-sm:
    fontFamily: IBM Plex Sans
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 14px
  currency-display:
    fontFamily: IBM Plex Sans
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
  currency-display-mobile:
    fontFamily: IBM Plex Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-mobile: 0.75rem
  margin: 1.5rem
  margin-mobile: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style
The design system establishes a high-trust, editorial-grade utility tailored for Egyptian residential consumers navigating tiered utility billing (Sheriha brackets) and energy costs. The product bridges domestic energy monitoring with personal wealth management, demanding a character that is authoritative, mathematically transparent, and quietly prestigious.

The aesthetic blends **Modern Minimalism** with **Financial Neoclassicism**:
- **Tone:** Authoritative, measured, transparent, domestic yet analytical.
- **Audience:** Residential bill-payers, household managers, and energy-conscious property owners in Egypt seeking precise, forecast-driven clarity on their EGP monthly expenditures.
- **Spatial & Cultural Harmony:** Native bilingual symmetry balancing Arabic (RTL) and English (LTR) layouts without typographic distortion or layout asymmetry.

## Colors
The palette evokes fiscal stability, ecological awareness, and domestic composure. Its deep green brand color is balanced with a light mint canvas and layered green-tinted surfaces.

- **Primary (`#004131` - Deep Green):** Anchors brand identity and primary emphasis.
- **Primary Container (`#145A46` - Forest Green):** Supports prominent filled actions, hero surfaces, and other high-emphasis containers.
- **Secondary (`#006C53` - Deep Emerald):** Applied to secondary emphasis, progress indicators, and interactive states.
- **Secondary Container (`#9AF4D4` - Light Mint):** Used for selected states, soft action surfaces, and tinted accents.
- **Neutral Primary (`#111E19` - Pine Charcoal):** Deep, warm off-black for high-legibility body text, titles, and numerical currency counters.
- **Neutral Secondary (`#404944` - Muted Charcoal):** For subordinate labels and units (kWh, EGP / ج.م); `#707974` is available for quieter outlines and affordances.
- **Canvas (`#EDFDF3` - Pale Mint):** Low-glare background for analytical and utility screens.
- **Card Background (`#FFFFFF` - Pure White):** Crisp elevation for actionable and analytical surfaces.
- **System States:**
  - **Success (`#2E9D69`):** Safe tier consumption limits and optimized off-peak usage.
  - **Warning (`#E6A23C`):** Tier bracket boundary approach (Threshold alerts).
  - **Error / High Tier (`#BA1A1A`):** Critical tier jumps (e.g., crossing into bracket 6/7 penalty pricing).

## Typography
The system uses **IBM Plex Sans** (paired natively with **IBM Plex Sans Arabic** in multilingual production). This typeface offers clean technical neutrality, high vertical x-height, and precise numeric shaping for both Western Arabic numerals (0-9) and Eastern Arabic numerals (٠-٩).

- **Bi-directional Engine:** Kerning, baseline heights, and visual weights correspond 1:1 between LTR and RTL scripts to prevent visual jump during locale switching.
- **Tabular Figures:** Always apply tabular lining (`tnum`) for consumption metrics, kilowatt gauges, and currency listings to maintain strict alignment in data tables and bill breakdowns.
- **Scale Hierarchy:**
  - `currency-display` handles top-level expected invoice costs.
  - `display-lg` provides top-of-funnel impact for kilowatt totals.
  - `label-*` tiers are systematically prioritized for unit notations (`ج.م`, `kWh`, `شريحة`).

## Layout & Spacing
The layout adheres to a strict 8pt spatial baseline grid with an integrated 4pt micro-step system for dense data cards.

- **Responsive Framework:**
  - **Mobile (<600dp):** Single-column fluid view with `1rem` outer margins. Essential calculation outputs stick above the fold. Touch targets maintain a minimum vertical box of 48dp.
  - **Tablet (600dp–1023dp):** 8-column layout. Split-pane layout: appliance calculation matrix on the left (or right in RTL), sticky live bill estimate summary on the alternate side.
  - **Desktop (≥1024dp):** 12-column layout max-capped at 1200px centered viewport.
- **RTL Fluidity:** Margins and gutters mirror automatically without asymmetrical card padding. Leading/trailing visual anchors adapt to start/end tokens.

## Elevation & Depth
Depth conveys physical hierarchy without visual clutter, employing ambient, tinted illumination rather than heavy dropshadows:

- **Base Layer:** The `#EDFDF3` matte canvas creates contrast beneath pure white cards.
- **Level 1 (Default Cards & Containers):**
  - Drop shadow: `0px 2px 8px rgba(20, 90, 70, 0.04), 0px 1px 2px rgba(17, 30, 25, 0.02)`.
  - Border: 1px hairline border in `rgba(20, 90, 70, 0.08)`.
- **Level 2 (Active Appliance Tiles & Segmented Tabs):**
  - Drop shadow: `0px 6px 16px rgba(20, 90, 70, 0.08), 0px 2px 4px rgba(20, 90, 70, 0.03)`.
  - Border: 1px solid `rgba(0, 108, 83, 0.20)`.
- **Level 3 (Sticky Bottom Navigation & Modals):**
  - Drop shadow: `0px -4px 20px rgba(17, 30, 25, 0.06)`.
  - Surface: `#FFFFFF` with 98% opacity and 12px blur (frosted fallback where supported).

## Shapes
The shape language uses balanced curvature (`roundedness: 2`), projecting modern friendliness while retaining utility-grade rigor.

- **Standard Containers & Cards:** `1rem` (16px) corner radius creates unified content clusters.
- **Large Summary Panels (`rounded-xl`):** `1.5rem` (24px) corner radius for primary hero meters and tier gauges.
- **Interactive Controls (Inputs, Segmented Pills, Buttons):** `0.75rem` (12px) to `1rem` (16px) for an ergonomic, finger-friendly touch footprint.
- **Status Badges & Sliders:** Full pill curve (`9999px`) for consumption tier tags and metric pills.

## Components

### Buttons
- **Primary:** Filled `#145A46` primary-container, text `#FFFFFF`, height 52px, radius 16px. Subtle scale tap interaction (`0.98`).
- **Secondary:** `#9AF4D4` secondary-container surface, text `#004131`, weight 600.
- **Outlined / Ghost:** 1px border `#006C53`, background transparent, text `#004131`.

### Cards & Metric Modules
- **Calculation Card:** White surface, Level 1 shadow, 16px padding. Houses appliance icons, hours slider, and calculated monthly cost.
- **Tier Bracket (Sheriha) Hero Card:** `#145A46` background with high-contrast text (`#FFFFFF`), displaying current active tier bracket (e.g., "الشريحة الرابعة"), consumption target gauge, and forecast total.

### Input Fields & Steppers
- **Text / Number Field:** Height 52px, background `#FFFFFF`, border 1px solid `rgba(191, 201, 195, 0.30)` (outline-variant), radius 12px. Focus state triggers a 2px `#006C53` secondary ring.
- **Counter Stepper:** Pill-shaped increment/decrement container with dual high-contrast action hit areas (44x44dp).

### Chips & Segmented Controls
- **Segmented Mode Switch (e.g., Monthly vs. Daily / Appliance vs. Meter):** Inset background `rgba(20, 90, 70, 0.06)`, pill wrapper. Active segment is pure white with Level 1 shadow and `#004131` text.
- **Status Badges:** Compact pill chips (`py: 4px, px: 10px`), pairing localized status labels with status token backgrounds (e.g., Warning: `#E6A23C` at 12% opacity with solid text).

### Navigation & Lists
- **Bottom Navigation Bar (Flutter-Ready):** 64px height + safe-area padding. Translucent white surface, subtle top border `rgba(20, 90, 70, 0.08)`. Selected item uses a soft pill background `#9AF4D4` with an active `#004131` icon and bold typography.
- **Appliance List Item:** Compact horizontal flex row: leading 40px icon box (tinted `#9AF4D4`), centered title and usage frequency, trailing kilowatt count and cost estimate.
