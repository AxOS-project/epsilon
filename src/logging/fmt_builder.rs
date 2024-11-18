use std::{borrow::Cow, fmt::Display};

use colored::{ColoredString, Colorize};

pub struct FmtBuilder<'a> {
    options: FmtOptions,
    parts: Vec<Part<'a>>,
}

pub enum Part<'a> {
    Borrowed(&'a str),
    Owned(String),
    Colored(ColoredString),
    Empty,
}

#[derive(Default)]
pub struct FmtOptions {
    pub colored: bool,
}

impl<'a> FmtBuilder<'a> {
    /// Creates a new builder
    pub fn new() -> Self {
        Self {
            options: FmtOptions::default(),
            parts: Vec::new(),
        }
    }

    pub fn options(&mut self, options: FmtOptions) -> &mut Self {
        self.options = options;

        self
    }

    pub fn append<S: Into<Part<'a>>>(&mut self, part: S) -> &mut Self {
        self.parts.push(part.into());

        self
    }

    pub fn append_if<F, S>(&mut self, condition: bool, string_fn: F) -> &mut Self
    where
        F: Fn() -> S,
        S: Into<Part<'a>>,
    {
        if condition {
            self.append(string_fn());
        }
        self
    }

    /// Builds a string representation.
    pub fn build(&self) -> String {
        let string_parts = self
            .parts
            .iter()
            .filter_map(|c| c.fmt_string(&self.options))
            .collect::<Vec<_>>();
        let cap = string_parts.iter().map(|c| c.len()).sum();
        string_parts
            .into_iter()
            .fold(String::with_capacity(cap), |mut acc, e| {
                acc.push_str(e.as_ref());
                acc
            })
    }
}

impl<'a> Display for FmtBuilder<'a> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        self.build().fmt(f)
    }
}

impl<'a> Part<'a> {
    fn fmt_string(&self, opts: &FmtOptions) -> Option<Cow<'_, str>> {
        match &self {
            Part::Borrowed(b) => Some(Cow::Borrowed(b)),
            Part::Owned(o) => Some(Cow::Borrowed(o)),
            Part::Colored(c) => Some(Cow::Owned(Self::fmt_colored(c, opts))),
            Part::Empty => None,
        }
    }

    fn fmt_colored(c: &ColoredString, opts: &FmtOptions) -> String {
        if opts.colored {
            c.to_string()
        } else {
            c.clone().clear().to_string()
        }
    }
}

impl<'a> From<String> for Part<'a> {
    fn from(val: String) -> Self {
        Part::Owned(val)
    }
}

impl<'a> From<&'a str> for Part<'a> {
    fn from(val: &'a str) -> Self {
        Part::Borrowed(val)
    }
}

impl<'a> From<&'a String> for Part<'a> {
    fn from(val: &'a String) -> Self {
        Part::Borrowed(val)
    }
}

impl<'a> From<ColoredString> for Part<'a> {
    fn from(val: ColoredString) -> Self {
        Part::Colored(val)
    }
}

impl<'a, P: Into<Part<'a>>> From<Option<P>> for Part<'a> {
    fn from(val: Option<P>) -> Self {
        val.map(P::into).unwrap_or(Part::Empty)
    }
}
