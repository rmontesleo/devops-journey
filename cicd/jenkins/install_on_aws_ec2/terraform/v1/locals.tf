
locals {
  setup_jenkins_agent = templatefile("${path.module}/scripts/setup_jenkins_agent.tpl", {})
}