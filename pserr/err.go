package pserr

import "github.com/joomcode/errorx"

var (
	PopsErrors = errorx.NewNamespace("pops")
)

var (
	DirectOutput = PopsErrors.NewType("direct_out")
)

var (
	Exitcode = errorx.RegisterProperty("pops.exitcode")
)
